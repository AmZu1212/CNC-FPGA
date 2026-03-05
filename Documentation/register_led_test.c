#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"
#include "xil_types.h"
#include "xilffs.h"
#include "ff.h"
#include <stdlib.h>



#define CMD_REG 			XPAR_COMMAND_GPIO_BASEADDR			//  8 bit
#define X_REG 				XPAR_X_GPIO_BASEADDR				// 32 bit
#define Y_REG 				XPAR_Y_GPIO_BASEADDR				// 32 bit
#define Z_REG 				XPAR_Z_GPIO_BASEADDR				// 16 bit
#define SPEED_REG 			XPAR_SPEED_GPIO_BASEADDR			//  8 bit
#define INTRC_REG 			XPAR_INTERCONNECT_GPIO_BASEADDR 	// 16 bit
#define INTRC_OUT_REG 		(INTRC_REG + 0x00)					//  8 bit output
#define INTRC_IN_REG 		(INTRC_REG + 0x08)					//  8 bit input
#define SLEEP_DURATION_USEC 1 									//    delay in microseconds

int main(void)
{
    init_platform(); // initialize hardware platform
    xil_printf("Round robin GPIO test\r\n");

    u32 regs[] = { X_REG, Y_REG, Z_REG, SPEED_REG, INTRC_OUT_REG };
    const int reg_count = sizeof(regs) / sizeof(regs[0]);

    // Ensure all outputs start low
    for (int i = 0; i < reg_count; ++i) {
        switch (i) {
        case 0: Xil_Out32(regs[i], 0U); break;          // X (32-bit)
        case 1: Xil_Out32(regs[i], 0U); break;          // Y (32-bit)
        case 2: Xil_Out16(regs[i], 0U); break;          // Z (16-bit)
        case 3: Xil_Out8(regs[i], 0U); break;           // CMD (8-bit)
        case 4: Xil_Out8(regs[i], 0U); break;           // INTER_OUT (8-bit)
        }
    }

    int idx = 0;
    int prev = reg_count - 1;
    u8 switch_active = 0U;

    while (1) {
        // Turn off the previous register, turn on the current one
        switch (prev) {
        case 0: Xil_Out32(regs[prev], 0U); break;
        case 1: Xil_Out32(regs[prev], 0U); break;
        case 2: Xil_Out16(regs[prev], 0U); break;
        case 3: Xil_Out8(regs[prev], 0U); break;
        case 4: Xil_Out8(regs[prev], 0U); break;
        }

        switch (idx) {
        case 0: Xil_Out32(regs[idx], 1U); break;
        case 1: Xil_Out32(regs[idx], 1U); break;
        case 2: Xil_Out16(regs[idx], 1U); break;
        case 3: Xil_Out8(regs[idx], 1U); break;
        case 4: Xil_Out8(regs[idx], 1U); break;
        }

        sleep(1);

        if (Xil_In8(INTRC_IN_REG) != 0U) {
            if (!switch_active) {
                xil_printf("ResetSwitch Detected!\r\n");
                switch_active = 1U;
            }
        } else {
            switch_active = 0U;
        }

        prev = idx;
        idx = (idx + 1) % reg_count;
    }

    cleanup_platform(); // not reached
    return 0;
}
