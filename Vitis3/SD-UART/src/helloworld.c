#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"
#include "xil_types.h"
#include "ff.h"
#include <stdlib.h>
#include <string.h>

#define SPEED_REG 			XPAR_SPEED_GPIO_BASEADDR			//  8 bit

static int read_line(FIL *fil, char *buf, unsigned int buf_size)
{
    UINT br = 0U;
    unsigned int idx = 0U;
    char ch;
    FRESULT res;

    if (fil == NULL || buf == NULL || buf_size < 2U) {
        return -1;
    }

    while (1) {
        res = f_read(fil, &ch, 1U, &br);
        if (res != FR_OK) {
            return -1;
        }

        if (br == 0U) {
            if (idx == 0U) {
                return 0; // EOF, no data
            }
            break; // EOF after partial line
        }

        if (ch == '\r') {
            continue;
        }

        if (ch == '\n') {
            break;
        }

        if (idx < (buf_size - 1U)) {
            buf[idx++] = ch;
        }
    }

    buf[idx] = '\0';
    return 1;
}

int main(void)
{
    FATFS fs;
    FIL fil;
    FRESULT result;
    char line[128];

    init_platform();
    xil_printf("RUN.G LED reader\r\n");

    Xil_Out8(SPEED_REG, 0U);

    result = f_mount(&fs, "0:/", 1);
    xil_printf("mount = %d\r\n", result);
    if (result != FR_OK) {
        xil_printf("Mount failed\r\n");
        while (1) {
            sleep(1);
        }
    }

    result = f_open(&fil, "0:/RUN.G", FA_READ);
    xil_printf("open = %d\r\n", result);
    if (result != FR_OK) {
        xil_printf("Open failed\r\n");
        while (1) {
            sleep(1);
        }
    }

    xil_printf("Reading RUN.G\r\n");

    while (1) {
        char *endptr;
        unsigned long value;

        int line_rc = read_line(&fil, line, sizeof(line));

        if (line_rc < 0) {
            xil_printf("Read failed\r\n");
            break;
        }

        if (line_rc == 0) {
            xil_printf("EOF reached, rewinding\r\n");
            result = f_lseek(&fil, 0);
            xil_printf("rewind = %d\r\n", result);
            if (result != FR_OK) {
                xil_printf("Rewind failed\r\n");
                break;
            }
            continue;
        }

        if (line[0] == '\0') {
            continue;
        }

        value = strtoul(line, &endptr, 0);
        if (endptr == line) {
            xil_printf("Skipping line: %s", line);
            continue;
        }

        xil_printf("LED = %d\r\n", (int)(value & 0xFFUL));
        Xil_Out8(SPEED_REG, (u8)(value & 0xFFUL));
        sleep(1);

        Xil_Out8(SPEED_REG, 0U);
        sleep(1);
    }

    f_close(&fil);
    f_mount(NULL, "0:/", 0);
    cleanup_platform();
    return 0;
}
