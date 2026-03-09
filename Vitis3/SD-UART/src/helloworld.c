#include "platform.h"
#include "xil_printf.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xparameters.h"
#include "ff.h"
#include <ctype.h>
#include <stdlib.h>
#include "sleep.h"

#define X_REG          XPAR_X_GPIO_BASEADDR
#define Y_REG          XPAR_Y_GPIO_BASEADDR
#define Z_REG          XPAR_Z_GPIO_BASEADDR
#define SPEED_REG      XPAR_SPEED_GPIO_BASEADDR
#define ACK_REG        XPAR_ACK_GPIO_BASEADDR
#define REQ_REG        XPAR_REQ_GPIO_BASEADDR
#define MOUNT_REQ_REG  XPAR_MOUNT_REQ_GPIO_BASEADDR
#define LAST_LINE_REG  XPAR_LAST_LINE_GPIO_BASEADDR
#define MOUNT_OK_REG   XPAR_MOUNT_OK_GPIO_BASEADDR
#define MOUNT_FAIL_REG XPAR_MOUNT_FAIL_GPIO_BASEADDR
#define DEFAULT_SPEED  180U

typedef struct {
    s32 x;
    s32 y;
    s32 z;
    u8 speed;
} MotionCommand;

static int read_line(FIL *fp, char *buf, unsigned int buf_size)
{
    UINT bytes_read = 0;
    unsigned int idx = 0U;
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

    return 1;
}

static int load_next_motion(FIL *fp,
                            char *line,
                            unsigned int line_size,
                            MotionCommand *cmd,
                            unsigned int *motion_count)
{
    int line_status;
    int parse_status;

    while (1) {
        line_status = read_line(fp, line, line_size);
        if (line_status <= 0) {
            return line_status;
        }

        parse_status = parse_motion_line(line, cmd);
        if (parse_status < 0) {
            xil_printf("parse error: %s\r\n", line);
            continue;
        }

        if (parse_status == 0) {
            continue;
        }

        *motion_count = *motion_count + 1U;
        return 1;
    }
}

static void write_motion_regs(const MotionCommand *cmd)
{
    Xil_Out32(X_REG, (u32)cmd->x);
    Xil_Out32(Y_REG, (u32)cmd->y);
    Xil_Out32(Z_REG, (u32)cmd->z);
    Xil_Out8(SPEED_REG, cmd->speed);
}

int main(void)
{
    FATFS fatfs;
    FIL file;
    FRESULT fr;
    char line[256];
    MotionCommand current_cmd = {0, 0, 0, 0U};
    MotionCommand buffered_cmd = {0, 0, 0, 0U};
    unsigned int motion_count = 0U;
    u8 mount_ok = 0U;
    u8 mount_fail = 0U;
    u8 ack_phase = 0U;
    int mounted = 0;
    int file_open = 0;
    int current_valid = 0;
    int buffered_valid = 0;
    int current_is_last = 0;

    init_platform();

    Xil_Out32(X_REG, 0U);
    Xil_Out32(Y_REG, 0U);
    Xil_Out32(Z_REG, 0U);
    Xil_Out8(SPEED_REG, 0U);
    Xil_Out8(ACK_REG, 0U);
    Xil_Out8(LAST_LINE_REG, 0U);
    Xil_Out8(MOUNT_OK_REG, 0U);
    Xil_Out8(MOUNT_FAIL_REG, 0U);

    xil_printf("PS protocol loop starting\r\n");

    while (1) {
        u8 mount_req = (u8)(Xil_In8(MOUNT_REQ_REG) & 0x01U);
        u8 req_phase = (u8)(Xil_In8(REQ_REG) & 0x03U);

        if (mount_req == 0U) {
            if (file_open) {
                f_close(&file);
                file_open = 0;
            }

            if (mounted) {
                f_mount(0, "0:/", 1U);
                mounted = 0;
                xil_printf("Unmounted\r\n");
            }

            motion_count = 0U;
            ack_phase = 0U;
            mount_ok = 0U;
            mount_fail = 0U;
            current_valid = 0;
            buffered_valid = 0;
            current_is_last = 0;
            Xil_Out32(X_REG, 0U);
            Xil_Out32(Y_REG, 0U);
            Xil_Out32(Z_REG, 0U);
            Xil_Out8(SPEED_REG, 0U);
            Xil_Out8(ACK_REG, ack_phase);
            Xil_Out8(LAST_LINE_REG, 0U);
            Xil_Out8(MOUNT_OK_REG, mount_ok);
            Xil_Out8(MOUNT_FAIL_REG, mount_fail);
            continue;
        }

        if (mount_fail != 0U) {
            continue;
        }

        if (!mounted) {
            fr = f_mount(&fatfs, "0:/", 1U);
            xil_printf("f_mount -> %d\r\n", (int)fr);
            if (fr != FR_OK) {
                mount_fail = 1U;
                Xil_Out8(MOUNT_FAIL_REG, mount_fail);
                xil_printf("Mount failed\r\n");
                continue;
            }

            fr = f_open(&file, "0:/RUN.G", FA_READ);
            xil_printf("f_open(RUN.G) -> %d\r\n", (int)fr);
            if (fr != FR_OK) {
                f_mount(0, "0:/", 1U);
                mount_fail = 1U;
                Xil_Out8(MOUNT_FAIL_REG, mount_fail);
                xil_printf("Open failed\r\n");
                continue;
            }

            file_open = 1;
            mounted = 1;
            motion_count = 0U;
            ack_phase = 0U;
            mount_ok = 1U;
            mount_fail = 0U;
            current_valid = 0;
            buffered_valid = 0;
            current_is_last = 0;
            current_cmd.x = 0;
            current_cmd.y = 0;
            current_cmd.z = 0;
            current_cmd.speed = DEFAULT_SPEED;
            Xil_Out8(ACK_REG, ack_phase);
            Xil_Out8(LAST_LINE_REG, 0U);
            Xil_Out8(MOUNT_OK_REG, mount_ok);
            Xil_Out8(MOUNT_FAIL_REG, mount_fail);

            if (load_next_motion(&file, line, sizeof(line), &current_cmd, &motion_count) > 0) {
                buffered_cmd = current_cmd;
                int preload_status = load_next_motion(&file, line, sizeof(line), &buffered_cmd, &motion_count);

                current_valid = 1;
                buffered_valid = (preload_status > 0);
                current_is_last = !buffered_valid;

                write_motion_regs(&current_cmd);
                Xil_Out8(LAST_LINE_REG, current_is_last ? 1U : 0U);
                usleep(5U);
                Xil_Out8(MOUNT_OK_REG, mount_ok);
                xil_printf("PRELOAD %d: X=%d Y=%d Z=%d F=%d\r\n",
                           (int)motion_count,
                           (int)current_cmd.x,
                           (int)current_cmd.y,
                           (int)current_cmd.z,
                           (int)current_cmd.speed);
            } else {
                f_close(&file);
                file_open = 0;
                f_mount(0, "0:/", 1U);
                mounted = 0;
                mount_ok = 0U;
                mount_fail = 1U;
                Xil_Out8(MOUNT_OK_REG, mount_ok);
                Xil_Out8(MOUNT_FAIL_REG, mount_fail);
                xil_printf("RUN.G has no valid G0/G1 motions\r\n");
            }

            continue;
        }

        if (!current_valid) {
            continue;
        }

        if (((req_phase == 0x01U) || (req_phase == 0x02U)) && (req_phase != ack_phase)) {
            if (current_is_last) {
                usleep(5U);
                ack_phase = req_phase;
                Xil_Out8(ACK_REG, ack_phase);
                xil_printf("LAST LINE ACK 0x%x\r\n", (unsigned int)ack_phase);
            } else {
                int next_status;

                current_cmd = buffered_cmd;
                write_motion_regs(&current_cmd);
                usleep(5U);
                ack_phase = req_phase;
                Xil_Out8(ACK_REG, ack_phase);

                next_status = load_next_motion(&file, line, sizeof(line), &buffered_cmd, &motion_count);
                buffered_valid = (next_status > 0);
                current_is_last = !buffered_valid;
                Xil_Out8(LAST_LINE_REG, current_is_last ? 1U : 0U);

                xil_printf("PHASE 0x%x -> %d: X=%d Y=%d Z=%d F=%d%s\r\n",
                           (unsigned int)ack_phase,
                           (int)motion_count,
                           (int)current_cmd.x,
                           (int)current_cmd.y,
                           (int)current_cmd.z,
                           (int)current_cmd.speed,
                           current_is_last ? " LAST" : "");
            }
        }
    }

    cleanup_platform();
    return 0;
}
