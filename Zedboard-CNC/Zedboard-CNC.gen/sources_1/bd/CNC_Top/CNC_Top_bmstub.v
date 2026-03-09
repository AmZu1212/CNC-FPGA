// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module CNC_Top (
  DDR_cas_n,
  DDR_cke,
  DDR_ck_n,
  DDR_ck_p,
  DDR_cs_n,
  DDR_reset_n,
  DDR_odt,
  DDR_ras_n,
  DDR_we_n,
  DDR_ba,
  DDR_addr,
  DDR_dm,
  DDR_dq,
  DDR_dqs_n,
  DDR_dqs_p,
  FIXED_IO_mio,
  FIXED_IO_ddr_vrn,
  FIXED_IO_ddr_vrp,
  FIXED_IO_ps_srstb,
  FIXED_IO_ps_clk,
  FIXED_IO_ps_porb,
  sys_clock,
  directionX,
  stepX,
  resetX,
  ms1X,
  ms2X,
  ms3X,
  enableX,
  led,
  enableY,
  directionY,
  stepY,
  resetY,
  ms1Y,
  ms2Y,
  ms3Y,
  enableZ,
  directionZ,
  stepZ,
  resetZ,
  ms1Z,
  ms2Z,
  ms3Z,
  ResetSwitch,
  Middle,
  Left,
  Right,
  Up,
  Down,
  Zswitch
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CAS_N" *)
  (* X_INTERFACE_MODE = "master DDR" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DDR, CAN_DEBUG false, TIMEPERIOD_PS 1250, MEMORY_TYPE COMPONENTS, DATA_WIDTH 8, CS_ENABLED true, DATA_MASK_ENABLED true, SLOT Single, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME TDM, CAS_LATENCY 11, CAS_WRITE_LATENCY 11" *)
  inout DDR_cas_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CKE" *)
  inout DDR_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_N" *)
  inout DDR_ck_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CK_P" *)
  inout DDR_ck_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR CS_N" *)
  inout DDR_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RESET_N" *)
  inout DDR_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ODT" *)
  inout DDR_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR RAS_N" *)
  inout DDR_ras_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR WE_N" *)
  inout DDR_we_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR BA" *)
  inout [2:0]DDR_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR ADDR" *)
  inout [14:0]DDR_addr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DM" *)
  inout [3:0]DDR_dm;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQ" *)
  inout [31:0]DDR_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_N" *)
  inout [3:0]DDR_dqs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddrx:1.0 DDR DQS_P" *)
  inout [3:0]DDR_dqs_p;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO MIO" *)
  (* X_INTERFACE_MODE = "master FIXED_IO" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME FIXED_IO, CAN_DEBUG false" *)
  inout [53:0]FIXED_IO_mio;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRN" *)
  inout FIXED_IO_ddr_vrn;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO DDR_VRP" *)
  inout FIXED_IO_ddr_vrp;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_SRSTB" *)
  inout FIXED_IO_ps_srstb;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_CLK" *)
  inout FIXED_IO_ps_clk;
  (* X_INTERFACE_INFO = "xilinx.com:display_processing_system7:fixedio:1.0 FIXED_IO PS_PORB" *)
  inout FIXED_IO_ps_porb;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.SYS_CLOCK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN CNC_Top_sys_clock, INSERT_VIP 0" *)
  input sys_clock;
  (* X_INTERFACE_IGNORE = "true" *)
  output directionX;
  (* X_INTERFACE_IGNORE = "true" *)
  output stepX;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETX RST" *)
  (* X_INTERFACE_MODE = "master RST.RESETX" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETX, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  output resetX;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms1X;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms2X;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms3X;
  (* X_INTERFACE_IGNORE = "true" *)
  output enableX;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]led;
  (* X_INTERFACE_IGNORE = "true" *)
  output enableY;
  (* X_INTERFACE_IGNORE = "true" *)
  output directionY;
  (* X_INTERFACE_IGNORE = "true" *)
  output stepY;
  (* X_INTERFACE_IGNORE = "true" *)
  output resetY;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms1Y;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms2Y;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms3Y;
  (* X_INTERFACE_IGNORE = "true" *)
  output enableZ;
  (* X_INTERFACE_IGNORE = "true" *)
  output directionZ;
  (* X_INTERFACE_IGNORE = "true" *)
  output stepZ;
  (* X_INTERFACE_IGNORE = "true" *)
  output resetZ;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms1Z;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms2Z;
  (* X_INTERFACE_IGNORE = "true" *)
  output ms3Z;
  (* X_INTERFACE_IGNORE = "true" *)
  input ResetSwitch;
  (* X_INTERFACE_IGNORE = "true" *)
  input Middle;
  (* X_INTERFACE_IGNORE = "true" *)
  input Left;
  (* X_INTERFACE_IGNORE = "true" *)
  input Right;
  (* X_INTERFACE_IGNORE = "true" *)
  input Up;
  (* X_INTERFACE_IGNORE = "true" *)
  input Down;
  (* X_INTERFACE_IGNORE = "true" *)
  input Zswitch;

  // stub module has no contents

endmodule
