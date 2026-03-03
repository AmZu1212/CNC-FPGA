// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module CNC_Top (
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
