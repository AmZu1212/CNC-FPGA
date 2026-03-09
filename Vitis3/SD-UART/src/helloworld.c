#include "platform.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xparameters.h"
#include "ff.h"
#include <ctype.h>
#include <stdlib.h>

#define ACK_REG        XPAR_ACK_GPIO_BASEADDR
#define REQ_REG        XPAR_REQ_GPIO_BASEADDR
#define MOUNT_OK_REG   XPAR_MOUNT_OK_GPIO_BASEADDR
#define MOUNT_FAIL_REG XPAR_MOUNT_FAIL_GPIO_BASEADDR

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    u8 speed;
} MotionCommand;

static int read_line(FIL *fp, char *buf, unsigned int buf_size)
{
    UINT bytes_read = 0;
    unsigned int idx = 0;
    char ch = 0;

    if ((fp == 0) || (buf == 0) || (buf_size < 2U)) {
        return -1;
    }

    while (idx < (buf_size - 1U)) {
        if (f_read(fp, &ch, 1U, &bytes_read) != FR_OK) {
            return -1;
        }

        if (bytes_read == 0U) {
            break;
        }

        if (ch == '\r') {
            continue;
        }

        if (ch == '\n') {
            break;
        }

        buf[idx] = ch;
        idx++;
    }

    buf[idx] = '\0';

    if ((idx == 0U) && (bytes_read == 0U)) {
        return 0;
    }

    return 1;
}

static void strip_comments(char *line)
{
    unsigned int read_idx = 0U;
    unsigned int write_idx = 0U;
    int in_paren_comment = 0;

    while (line[read_idx] != '\0') {
        if (line[read_idx] == ';') {
            break;
        }

        if (line[read_idx] == '(') {
            in_paren_comment = 1;
            read_idx++;
            continue;
        }

        if (in_paren_comment) {
            if (line[read_idx] == ')') {
                in_paren_comment = 0;
            }
            read_idx++;
            continue;
        }

        line[write_idx] = line[read_idx];
        write_idx++;
        read_idx++;
    }

    line[write_idx] = '\0';
}

static int parse_motion_line(char *line, MotionCommand *cmd)
{
    char *cursor = line;
    int saw_motion = 0;
    int motion_type = -1;

    strip_comments(line);

    while (*cursor != '\0') {
        while (isspace((unsigned char)*cursor)) {
            cursor++;
        }

        if (*cursor == '\0') {
            break;
        }

        if (toupper((unsigned char)*cursor) == 'G') {
            long g_code;

            cursor++;
            g_code = strtol(cursor, &cursor, 10);
            if ((g_code == 0L) || (g_code == 1L)) {
                motion_type = (int)g_code;
                saw_motion = 1;
            }
            continue;
        }

        if (!saw_motion) {
            while ((*cursor != '\0') && !isspace((unsigned char)*cursor)) {
                cursor++;
            }
            continue;
        }

        if (toupper((unsigned char)*cursor) == 'X') {
            double value;
            cursor++;
            value = strtod(cursor, &cursor);
            cmd->x = (s32)(value * 1000.0);
            continue;
        }

        if (toupper((unsigned char)*cursor) == 'Y') {
            double value;
            cursor++;
            value = strtod(cursor, &cursor);
            cmd->y = (s32)(value * 1000.0);
            continue;
        }

        if (toupper((unsigned char)*cursor) == 'Z') {
            double value;
            cursor++;
            value = strtod(cursor, &cursor);
            cmd->z = (s32)(value * 1000.0);
            continue;
        }

        if (toupper((unsigned char)*cursor) == 'F') {
            double value;
            long converted;
            cursor++;
            value = strtod(cursor, &cursor);
            converted = (long)(value / 60.0);
            if ((converted < 0L) || (converted > 255L)) {
                return -1;
            }
            cmd->speed = (u8)converted;
            continue;
        }

        while ((*cursor != '\0') && !isspace((unsigned char)*cursor)) {
            cursor++;
        }
    }

    if (!saw_motion) {
        return 0;
    }

    return (motion_type == 0) ? 1 : 1;
}

int main(void)
{
    FATFS fatfs;
    FIL file;
    FRESULT fr;
    char line[256];
    int line_status;
    int parse_status;
    unsigned int line_num = 0U;
    MotionCommand cmd = {0, 0, 0, 0U};

    init_platform();

    Xil_Out8(ACK_REG, 0U);
    Xil_Out8(MOUNT_OK_REG, 0U);
    Xil_Out8(MOUNT_FAIL_REG, 0U);

    xil_printf("SD smoke test starting\r\n");
    xil_printf("REQ=0x%x\r\n", (unsigned int)(Xil_In8(REQ_REG) & 0x03U));

    fr = f_mount(&fatfs, "0:/", 1U);
    xil_printf("f_mount -> %d\r\n", (int)fr);
    if (fr != FR_OK) {
        Xil_Out8(MOUNT_FAIL_REG, 1U);
        xil_printf("Mount failed\r\n");
        while (1) {
        }
    }

    Xil_Out8(MOUNT_OK_REG, 1U);
    xil_printf("Mount ok\r\n");

    fr = f_open(&file, "0:/RUN.G", FA_READ);
    xil_printf("f_open(RUN.G) -> %d\r\n", (int)fr);
    if (fr != FR_OK) {
        Xil_Out8(MOUNT_OK_REG, 0U);
        Xil_Out8(MOUNT_FAIL_REG, 1U);
        xil_printf("Open failed\r\n");
        while (1) {
        }
    }

    xil_printf("RUN.G opened\r\n");

    while (1) {
        line_status = read_line(&file, line, sizeof(line));
        if (line_status < 0) {
            xil_printf("read_line error\r\n");
            break;
        }

        if (line_status == 0) {
            xil_printf("EOF\r\n");
            break;
        }

        parse_status = parse_motion_line(line, &cmd);
        if (parse_status < 0) {
            line_num++;
            xil_printf("%d: parse error\r\n", (int)line_num);
            continue;
        }

        if (parse_status == 0) {
            continue;
        }

        line_num++;
        xil_printf("%d: X=%d Y=%d Z=%d F=%d\r\n",
                   (int)line_num,
                   (int)cmd.x,
                   (int)cmd.y,
                   (int)cmd.z,
                   (int)cmd.speed);
    }

    f_close(&file);
    f_mount(0, "0:/", 1U);
    xil_printf("Done\r\n");

    while (1) {
    }

    cleanup_platform();
    return 0;
}
