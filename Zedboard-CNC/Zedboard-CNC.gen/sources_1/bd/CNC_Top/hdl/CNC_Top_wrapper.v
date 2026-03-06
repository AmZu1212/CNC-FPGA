//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Fri Mar  6 21:26:36 2026
//Host        : OBSIDIAN running 64-bit major release  (build 9200)
//Command     : generate_target CNC_Top_wrapper.bd
//Design      : CNC_Top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module CNC_Top_wrapper
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    Down,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    Left,
    Middle,
    ResetSwitch,
    Right,
    Up,
    Zswitch,
    directionX,
    directionY,
    directionZ,
    enableX,
    enableY,
    enableZ,
    led,
    ms1X,
    ms1Y,
    ms1Z,
    ms2X,
    ms2Y,
    ms2Z,
    ms3X,
    ms3Y,
    ms3Z,
    resetX,
    resetY,
    resetZ,
    stepX,
    stepY,
    stepZ,
    sys_clock);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  input Down;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input Left;
  input Middle;
  input ResetSwitch;
  input Right;
  input Up;
  input Zswitch;
  output directionX;
  output directionY;
  output directionZ;
  output enableX;
  output enableY;
  output enableZ;
  output [7:0]led;
  output ms1X;
  output ms1Y;
  output ms1Z;
  output ms2X;
  output ms2Y;
  output ms2Z;
  output ms3X;
  output ms3Y;
  output ms3Z;
  output resetX;
  output resetY;
  output resetZ;
  output stepX;
  output stepY;
  output stepZ;
  input sys_clock;

  wire [14:0]DDR_addr;
  wire [2:0]DDR_ba;
  wire DDR_cas_n;
  wire DDR_ck_n;
  wire DDR_ck_p;
  wire DDR_cke;
  wire DDR_cs_n;
  wire [3:0]DDR_dm;
  wire [31:0]DDR_dq;
  wire [3:0]DDR_dqs_n;
  wire [3:0]DDR_dqs_p;
  wire DDR_odt;
  wire DDR_ras_n;
  wire DDR_reset_n;
  wire DDR_we_n;
  wire Down;
  wire FIXED_IO_ddr_vrn;
  wire FIXED_IO_ddr_vrp;
  wire [53:0]FIXED_IO_mio;
  wire FIXED_IO_ps_clk;
  wire FIXED_IO_ps_porb;
  wire FIXED_IO_ps_srstb;
  wire Left;
  wire Middle;
  wire ResetSwitch;
  wire Right;
  wire Up;
  wire Zswitch;
  wire directionX;
  wire directionY;
  wire directionZ;
  wire enableX;
  wire enableY;
  wire enableZ;
  wire [7:0]led;
  wire ms1X;
  wire ms1Y;
  wire ms1Z;
  wire ms2X;
  wire ms2Y;
  wire ms2Z;
  wire ms3X;
  wire ms3Y;
  wire ms3Z;
  wire resetX;
  wire resetY;
  wire resetZ;
  wire stepX;
  wire stepY;
  wire stepZ;
  wire sys_clock;

  CNC_Top CNC_Top_i
       (.DDR_addr(DDR_addr),
        .DDR_ba(DDR_ba),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm),
        .DDR_dq(DDR_dq),
        .DDR_dqs_n(DDR_dqs_n),
        .DDR_dqs_p(DDR_dqs_p),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .Down(Down),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .Left(Left),
        .Middle(Middle),
        .ResetSwitch(ResetSwitch),
        .Right(Right),
        .Up(Up),
        .Zswitch(Zswitch),
        .directionX(directionX),
        .directionY(directionY),
        .directionZ(directionZ),
        .enableX(enableX),
        .enableY(enableY),
        .enableZ(enableZ),
        .led(led),
        .ms1X(ms1X),
        .ms1Y(ms1Y),
        .ms1Z(ms1Z),
        .ms2X(ms2X),
        .ms2Y(ms2Y),
        .ms2Z(ms2Z),
        .ms3X(ms3X),
        .ms3Y(ms3Y),
        .ms3Z(ms3Z),
        .resetX(resetX),
        .resetY(resetY),
        .resetZ(resetZ),
        .stepX(stepX),
        .stepY(stepY),
        .stepZ(stepZ),
        .sys_clock(sys_clock));
endmodule
