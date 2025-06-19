// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module CNC_Top (
  sys_clock,
  right,
  left,
  drv_direction,
  drv_step,
  drv_reset,
  drv_ms1,
  drv_ms2,
  drv_ms3,
  drv_enable,
  led
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.SYS_CLOCK" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN CNC_Top_sys_clock, INSERT_VIP 0" *)
  input sys_clock;
  (* X_INTERFACE_IGNORE = "true" *)
  input right;
  (* X_INTERFACE_IGNORE = "true" *)
  input left;
  (* X_INTERFACE_IGNORE = "true" *)
  output drv_direction;
  (* X_INTERFACE_IGNORE = "true" *)
  output drv_step;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.DRV_RESET RST" *)
  (* X_INTERFACE_MODE = "master RST.DRV_RESET" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.DRV_RESET, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  output drv_reset;
  (* X_INTERFACE_IGNORE = "true" *)
  output drv_ms1;
  (* X_INTERFACE_IGNORE = "true" *)
  output drv_ms2;
  (* X_INTERFACE_IGNORE = "true" *)
  output drv_ms3;
  (* X_INTERFACE_IGNORE = "true" *)
  output drv_enable;
  (* X_INTERFACE_IGNORE = "true" *)
  output [7:0]led;

  // stub module has no contents

endmodule
