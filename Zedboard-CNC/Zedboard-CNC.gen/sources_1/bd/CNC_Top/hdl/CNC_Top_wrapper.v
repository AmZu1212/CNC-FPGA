//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Wed Mar  4 17:17:25 2026
//Host        : OBSIDIAN running 64-bit major release  (build 9200)
//Command     : generate_target CNC_Top_wrapper.bd
//Design      : CNC_Top_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module CNC_Top_wrapper
   (Down,
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
  input Down;
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

  wire Down;
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
       (.Down(Down),
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
