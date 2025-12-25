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
#define X_REG 				XPAR_X_GPIO_BASEADDR	// 32 bit
#define Y_REG 				XPAR_Y_GPIO_BASEADDR	// 32 bit
#define Z_REG 				XPAR_Z_GPIO_BASEADDR	// 16 bit
#define CMD_REG 			XPAR_COMMAND_GPIO_BASEADDR	// 8 bit
#define INTRC_REG 			XPAR_INTERCONNECT_GPIO_BASEADDR // 16 bit
#define INTRC_OUT_REG 		(INTRC_REG + 0x00)	//  8 bit output (ch1)
#define INTRC_IN_REG 		(INTRC_REG + 0x08)	//  8 bit input  (ch2 data offset for AXI GPIO)
#define SLEEP_DURATION_USEC 1 		// in microseconds

// =================== ENUMS & STRUCTS =================== //
typedef struct {
    u32 x;
    u32 y;
    u32 z;
    u32 cmd;
} MotionCommand;

typedef enum {
    MACHINE_DONE = 0,
    MACHINE_STARTING = 1,
    MACHINE_BUSY = 2,
    MACHINE_READY = 3
} MachineState;

typedef enum {
    MSG_IDLE = 0,
	MSG_DATA_READY = 1,
    MSG_EOF = 2,
    MSG_ERROR = 3,
    MSG_NO_FILE = 4,
    MSG_FILE_LOADED = 5,
    MSG_WAITING = 6
} Messages;

// =================== HELPERS =================== //
static void print_current_line(MotionCommand cmd)
{
    xil_printf("Sent X:%lu Y:%lu Z:%lu CMD:%lu\r\n",
               (unsigned long)cmd.x,
               (unsigned long)cmd.y,
               (unsigned long)cmd.z,
               (unsigned long)cmd.cmd);
}

static void write_width(u32 addr, u8 width_bits, u32 value)
{
    switch (width_bits) {
    case 32: Xil_Out32(addr, value); break;
    case 16: Xil_Out16(addr, (u16)value); break;
    default: Xil_Out8(addr, (u8)value); break;
    }
}

static MotionCommand parse_line(const char *line)
{
    MotionCommand m = {0};
    char *end = (char *)line;

    m.x = strtoul(end, &end, 10);
    m.y = strtoul(end, &end, 10);
    m.z = strtoul(end, &end, 10);
    m.cmd = strtoul(end, &end, 10);

    return m;
}

// =================== MAIN =================== //
int main(void)
{
    init_platform(); // initialize hardware platform
    xil_printf("Runtime mailbox loop\r\n");

    FATFS fs;
    FIL fil;
    char line[128];
    int file_loaded = 0;
    u8 error_active = 0U;

    // Clear outputs
    write_width(X_REG, 32U, 0U);
    write_width(Y_REG, 32U, 0U);
    write_width(Z_REG, 16U, 0U);
    write_width(CMD_REG, 8U, 0U);
    write_width(INTRC_OUT_REG, 8U, 0U);

    while (1) {

		// load "mailbox"
        u8 mailbox = Xil_In8(INTRC_IN_REG);

        if (error_active && mailbox == MACHINE_STARTING) {
            write_width(INTRC_OUT_REG, 8U, 0U);
            error_active = 0U;
        }

		// machine state handling
        switch (mailbox) {
        case MACHINE_DONE: // idle / stopped; unload SD file
            write_width(INTRC_OUT_REG, 8U, MSG_IDLE);
            if (file_loaded) {
                f_close(&fil);
                f_mount(NULL, "0:/", 0);
                file_loaded = 0;
                xil_printf("SD file unloaded\r\n");
            }
            break;

		case MACHINE_STARTING: // Load/reload SD file
            if (!file_loaded) {
                if (f_mount(&fs, "0:/", 1) != FR_OK) {
                    xil_printf("Mount failed\r\n");
                    write_width(INTRC_OUT_REG, 8U, MSG_ERROR);
                    error_active = 1U;
                    break;
                }
                if (f_open(&fil, "0:/RUN.G", FA_READ) != FR_OK) {
                    xil_printf("Open failed\r\n");
                    write_width(INTRC_OUT_REG, 8U, MSG_ERROR);
                    error_active = 1U;
                    break;
                }
                file_loaded = 1;
            } else {
                f_lseek(&fil, 0); // rewind for reload, safety
            }
            write_width(INTRC_OUT_REG, 8U, MSG_FILE_LOADED);
            xil_printf("SD file ready\r\n");
            break;

        case MACHINE_BUSY: // Machine signaled busy; do nothing...
            write_width(INTRC_OUT_REG, 8U, MSG_WAITING);
            break;

        case MACHINE_READY: // fetch next instruction
            if (!file_loaded) {
                xil_printf("No file loaded\r\n");
                write_width(INTRC_OUT_REG, 8U, MSG_NO_FILE);
                break;
            }

            if (!f_gets(line, sizeof(line), &fil)) {
                // EOF: notify, unload, and wait for restart
                write_width(INTRC_OUT_REG, 8U, MSG_EOF);
                f_close(&fil);
                f_mount(NULL, "0:/", 0);
                file_loaded = 0;
                break;
            }

			// all is fine, push command
            MotionCommand cmd = parse_line(line);
            write_width(X_REG, 32U, cmd.x);
            write_width(Y_REG, 32U, cmd.y);
            write_width(Z_REG, 16U, cmd.z);
            write_width(CMD_REG, 8U, cmd.cmd);
            write_width(INTRC_OUT_REG, 8U, MSG_DATA_READY);

			// print to serial
            print_current_line(cmd);
            break;

        default:// shouldnt reach it
			xil_printf("Unknown mailbox state: %u\r\n", (unsigned)mailbox);
            break;
        }

		/// TODO: adjust delay to fit clocks properly
        usleep(SLEEP_DURATION_USEC); // sleep for 1us to avoid busy loop
    }

    cleanup_platform(); // not reached
    return 0;
}

// int RegisterTestMain(void)
// {
//     init_platform(); // initialize hardware platform
//     xil_printf("Round robin GPIO test\r\n");
//
//     u32 regs[] = { X_REG, Y_REG, Z_REG, CMD_REG, INTRC_OUT_REG };
//     const int reg_count = sizeof(regs) / sizeof(regs[0]);
//
//     // Ensure all outputs start low
//     for (int i = 0; i < reg_count; ++i) {
//         switch (i) {
//         case 0: Xil_Out32(regs[i], 0U); break;          // X (32-bit)
//         case 1: Xil_Out32(regs[i], 0U); break;          // Y (32-bit)
//         case 2: Xil_Out16(regs[i], 0U); break;          // Z (16-bit)
//         case 3: Xil_Out8(regs[i], 0U); break;           // CMD (8-bit)
//         case 4: Xil_Out8(regs[i], 0U); break;           // INTER_OUT (8-bit)
//         }
//     }
//
//     int idx = 0;
//     int prev = reg_count - 1;
//     u8 switch_active = 0U;
//
//     while (1) {
//         // Turn off the previous register, turn on the current one
//         switch (prev) {
//         case 0: Xil_Out32(regs[prev], 0U); break;
//         case 1: Xil_Out32(regs[prev], 0U); break;
//         case 2: Xil_Out16(regs[prev], 0U); break;
//         case 3: Xil_Out8(regs[prev], 0U); break;
//         case 4: Xil_Out8(regs[prev], 0U); break;
//         }
//
//         switch (idx) {
//         case 0: Xil_Out32(regs[idx], 1U); break;
//         case 1: Xil_Out32(regs[idx], 1U); break;
//         case 2: Xil_Out16(regs[idx], 1U); break;
//         case 3: Xil_Out8(regs[idx], 1U); break;
//         case 4: Xil_Out8(regs[idx], 1U); break;
//         }
//
//         sleep(1);
//
//         if (Xil_In8(INTRC_IN_REG) != 0U) {
//             if (!switch_active) {
//                 xil_printf("Detected switch\r\n");
//                 switch_active = 1U;
//             }
//         } else {
//             switch_active = 0U;
//         }
//
//         prev = idx;
//         idx = (idx + 1) % reg_count;
//     }
//
//     cleanup_platform(); // not reached
//     return 0;
// }

// int OldMain(void)
// {
//     init_platform();
//     xil_printf("SD lines -> LEDs\r\n");
//
//     FATFS fs;
//     FIL fil;
//
//     if (f_mount(&fs, "0:/", 1) != FR_OK)
//         while (1);
//
//     if (f_open(&fil, "0:/RUN.G", FA_READ) != FR_OK)
//         while (1);
//
//     char line[64];
//
//     while (1) {
//         if (!f_gets(line, sizeof(line), &fil)) {
//             f_lseek(&fil, 0);
//             continue;
//         }
//
//         char *end;
//         u32 v = strtoul(line, &end, 10);
//         if (end == line)
//             continue;
//
//         xil_printf("v=%d\r\n", (int)v);
//         Xil_Out32(LED_REG, v & 0xFF);
//
//         sleep(1);
//     }
//
//     cleanup_platform();
//     return 100;
// }
