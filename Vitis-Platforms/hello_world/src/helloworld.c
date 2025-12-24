// /******************************************************************************
// * Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
// * SPDX-License-Identifier: MIT
// ******************************************************************************/
// /*
//  * helloworld.c: simple test application
//  *
//  * This application configures UART 16550 to baud rate 9600.
//  * PS7 UART (Zynq) is not initialized by this application, since
//  * bootrom/bsp configures it to baud rate 115200
//  *
//  * ------------------------------------------------
//  * | UART TYPE   BAUD RATE                        |
//  * ------------------------------------------------
//  *   uartns550   9600
//  *   uartlite    Configurable only in HW design
//  *   ps7_uart    115200 (configured by bootrom/bsp)
//  */

// #include <stdio.h>
// #include "platform.h"
// #include "xil_printf.h"
// #include "xparameters.h"
// #include "xil_io.h"
// #include "sleep.h"

// #define GPIO_BASE_ADDR   XPAR_AXI_GPIO_0_BASEADDR

// #define GPIO_CH1_DATA    0x00   // gpio_io_o
// #define GPIO_CH2_DATA    0x08   // gpio2_io_i

// int main()
// {
//     init_platform();

//     print("Hello World\n\r");
//     print("Successfully ran Hello World application\n");
//     print("i hate my life x666 haha\n");


//     print("Hello World\r\n");
//     print("AXI GPIO MMIO loopback test\r\n");

//     u32 v = 0x12345678;

//     while (1) {
//         Xil_Out32(GPIO_BASE_ADDR + GPIO_CH1_DATA, v);
//         u32 r = Xil_In32(GPIO_BASE_ADDR + GPIO_CH2_DATA);

//         xil_printf("W: 0x%08lx  R: 0x%08lx\r\n",
//                    (unsigned long)v,
//                    (unsigned long)r);
//         print("bla bla\n");

//         v++;
//         sleep(3);
//     }
//     cleanup_platform();
//     return 0;
// }


#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xil_io.h"
#include "sleep.h"
#include "xil_types.h"

#define GPIO_BASE_ADDR   XPAR_AXI_GPIO_0_BASEADDR
#define GPIO_CH1_DATA    0x00

int main(void)
{
    init_platform();

    xil_printf("LED counter demo\r\n");

    u32 counter = 0;

    while (1) {
        counter = (counter + 1) & 0xFFFF;

        Xil_Out32(GPIO_BASE_ADDR + GPIO_CH1_DATA, counter & 0xFF);
        xil_printf("counter = %u\r\n", (unsigned)counter);

        u32 rd = Xil_In32(GPIO_BASE_ADDR + GPIO_CH1_DATA);
        xil_printf("counter=%u rd=%u\r\n", (unsigned)counter, (unsigned)rd);
        xil_printf("================\r\n");
        sleep(2);
    }
}
