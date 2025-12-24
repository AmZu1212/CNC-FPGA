
// =================== INCLUDES =================== //
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"
#include "xil_types.h"
#include "xilffs.h"
#include "ff.h"
#include <stdlib.h>

// =================== DEFINES =================== //
// #define CNC_BASE        XPAR_CNC_0_S00_AXI_BASEADDR

#define REG_CONTROL     0x00
#define REG_STATUS      0x04
#define REG_XY          0x08
#define REG_ZCMD        0x0C

#define CTRL_START      (1u << 0)
#define CTRL_ABORT      (1u << 1)
#define CTRL_CLR_ERR    (1u << 2)

#define STAT_BUSY       (1u << 0)
#define STAT_DONE       (1u << 1)
#define STAT_ERR        (1u << 2)

// =================== HELPERS =================== //


#define LED_REG (XPAR_AXI_GPIO_0_BASEADDR + 0x00)

int main(void)
{
    init_platform();
    xil_printf("SD lines -> LEDs\r\n");

    FATFS fs;
    FIL fil;

    if (f_mount(&fs, "0:/", 1) != FR_OK)
        while (1);

    if (f_open(&fil, "0:/RUN.G", FA_READ) != FR_OK)
        while (1);

    char line[64];

    while (1) {
        if (!f_gets(line, sizeof(line), &fil)) {
            f_lseek(&fil, 0);
            continue;
        }

        char *end;
        u32 v = strtoul(line, &end, 10);
        if (end == line)
            continue;

        xil_printf("v=%d\r\n", (int)v);
        Xil_Out32(LED_REG, v & 0xFF);

        sleep(1);
    }
}

