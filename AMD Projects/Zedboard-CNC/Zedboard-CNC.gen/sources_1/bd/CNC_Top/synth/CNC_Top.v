//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Wed Jun 18 02:25:55 2025
//Host        : OBSIDIAN running 64-bit major release  (build 9200)
//Command     : generate_target CNC_Top.bd
//Design      : CNC_Top
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "CNC_Top,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=CNC_Top,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,da_clkrst_cnt=1,synth_mode=None}" *) (* HW_HANDOFF = "CNC_Top.hwdef" *) 
module CNC_Top
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.DRV_RESET RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.DRV_RESET, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output drv_reset;
  output drv_step;
  output [7:0]led;
  input left;
  input right;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN CNC_Top_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;

  wire DriverController_0_dir;
  wire DriverController_0_en;
  wire DriverController_0_step;
  wire clk_wiz_clk_out1;
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
  wire [0:0]xlconstant_1_dout;

  CNC_Top_A4988_Driver_IO_0_0 A4988_Driver_IO
       (.direction(DriverController_0_dir),
        .drv_direction(drv_direction),
        .drv_enable(drv_enable),
        .drv_ms1(drv_ms1),
        .drv_ms2(drv_ms2),
        .drv_ms3(drv_ms3),
        .drv_reset(drv_reset),
        .drv_step(drv_step),
        .enable(DriverController_0_en),
        .ms1(xlconstant_1_dout),
        .ms2(xlconstant_1_dout),
        .ms3(xlconstant_1_dout),
        .reset(xlconstant_1_dout),
        .step(DriverController_0_step));
  CNC_Top_DriverController_0_0 DriverController
       (.ccw(left),
        .clk(clk_wiz_clk_out1),
        .cw(right),
        .dir(DriverController_0_dir),
        .en(DriverController_0_en),
        .step(DriverController_0_step));
  CNC_Top_LED_IO_0_0 LED_IO_0
       (.in0(drv_enable),
        .in1(drv_direction),
        .in2(drv_step),
        .in3(drv_reset),
        .in4(drv_ms1),
        .in5(drv_ms2),
        .in6(drv_ms3),
        .in7(xlconstant_1_dout),
        .led(led));
  CNC_Top_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock),
        .clk_out1(clk_wiz_clk_out1),
        .reset(xlconstant_1_dout));
  CNC_Top_xlconstant_0_1 const_0
       (.dout(xlconstant_1_dout));
endmodule
