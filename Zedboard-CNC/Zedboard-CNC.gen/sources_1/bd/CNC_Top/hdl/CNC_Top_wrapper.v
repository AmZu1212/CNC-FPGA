//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Thu Jun 19 21:48:00 2025
//Host        : Alex-PC running 64-bit major release  (build 9200)
//Command     : generate_target CNC_Top_wrapper.bd
//Design      : CNC_Top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module CNC_Top_wrapper
   (drv_direction,
    drv_enable,
    drv_ms1,
    drv_ms2,
    drv_ms3,
    drv_reset,
    drv_step,
    led,
    left,
    right,
    sys_clock);
  output drv_direction;
  output drv_enable;
  output drv_ms1;
  output drv_ms2;
  output drv_ms3;
  output drv_reset;
  output drv_step;
  output [7:0]led;
  input left;
  input right;
  input sys_clock;

  wire drv_direction;
  wire drv_enable;
  wire drv_ms1;
  wire drv_ms2;
  wire drv_ms3;
  wire drv_reset;
  wire drv_step;
  wire [7:0]led;
  wire left;
  wire right;
  wire sys_clock;

  CNC_Top CNC_Top_i
       (.drv_direction(drv_direction),
        .drv_enable(drv_enable),
        .drv_ms1(drv_ms1),
        .drv_ms2(drv_ms2),
        .drv_ms3(drv_ms3),
        .drv_reset(drv_reset),
        .drv_step(drv_step),
        .led(led),
        .left(left),
        .right(right),
        .sys_clock(sys_clock));
endmodule
