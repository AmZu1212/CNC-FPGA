//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Wed Mar  4 17:17:25 2026
//Host        : OBSIDIAN running 64-bit major release  (build 9200)
//Command     : generate_target CNC_Top.bd
//Design      : CNC_Top
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "CNC_Top,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=CNC_Top,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=14,numReposBlks=14,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=11,numPkgbdBlks=0,bdsource=USER,da_board_cnt=2,da_clkrst_cnt=1,synth_mode=None}" *) (* HW_HANDOFF = "CNC_Top.hwdef" *) 
module CNC_Top
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETX RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETX, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output resetX;
  output resetY;
  output resetZ;
  output stepX;
  output stepY;
  output stepZ;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.SYS_CLOCK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.SYS_CLOCK, CLK_DOMAIN CNC_Top_sys_clock, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input sys_clock;

  wire [4:0]Buttons_Vector_0_keys;
  wire Down;
  wire DriverController_0_en;
  wire DriverController_0_step;
  wire DriverController_X1_step_risingedge;
  wire DriverController_X2_step_risingedge;
  wire DriverController_X_dir_out;
  wire DriverController_X_step_risingedge;
  wire DriverController_Y_dir_out;
  wire DriverController_Y_en;
  wire DriverController_Y_step;
  wire DriverController_Z_dir_out;
  wire DriverController_Z_en;
  wire DriverController_Z_step;
  wire GCODE_Parser_0_cmd_ready;
  wire GCODE_Parser_0_enable;
  wire [31:0]GCODE_Parser_0_next_pos_x;
  wire [31:0]GCODE_Parser_0_next_pos_y;
  wire [31:0]GCODE_Parser_0_next_pos_z;
  wire [7:0]GCODE_Parser_0_next_speed;
  wire GCODE_Parser_0_rewind;
  wire GcodeFetcher_0_cmd_last;
  wire [31:0]GcodeFetcher_0_cmd_pos_x;
  wire [31:0]GcodeFetcher_0_cmd_pos_y;
  wire [31:0]GcodeFetcher_0_cmd_pos_z;
  wire [7:0]GcodeFetcher_0_cmd_speed;
  wire GcodeFetcher_0_cmd_valid;
  wire Left;
  wire Middle;
  wire ResetSwitch;
  wire Right;
  wire Up;
  wire [7:0]XYZ_Axis_Coordinator_0_current_speed;
  wire [63:0]XYZ_Axis_Coordinator_0_cycles_per_step_x;
  wire [63:0]XYZ_Axis_Coordinator_0_cycles_per_step_y;
  wire [63:0]XYZ_Axis_Coordinator_0_cycles_per_step_z;
  wire XYZ_Axis_Coordinator_0_dir_x;
  wire XYZ_Axis_Coordinator_0_dir_y;
  wire XYZ_Axis_Coordinator_0_dir_z;
  wire [31:0]XYZ_Axis_Coordinator_0_direction_change_buffer;
  wire XYZ_Axis_Coordinator_0_load_next_line;
  wire [7:0]XYZ_Axis_Coordinator_0_target_speed;
  wire Zswitch;
  wire clk_wiz_clk_out1;
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
  wire [0:0]xlconstant_1_dout;

  CNC_Top_A4988_Driver_IO_0_0 A4988_Driver_IO
       (.direction(DriverController_X_dir_out),
        .drv_direction(directionX),
        .drv_enable(enableX),
        .drv_ms1(ms1X),
        .drv_ms2(ms2X),
        .drv_ms3(ms3X),
        .drv_reset(resetX),
        .drv_step(stepX),
        .enable(DriverController_0_en),
        .ms1(xlconstant_1_dout),
        .ms2(xlconstant_1_dout),
        .ms3(xlconstant_1_dout),
        .reset(ResetSwitch),
        .step(DriverController_0_step));
  CNC_Top_A4988_Driver_IO_1 A4988_Driver_IO1
       (.direction(DriverController_Y_dir_out),
        .drv_direction(directionZ),
        .drv_enable(enableZ),
        .drv_ms1(ms1Z),
        .drv_ms2(ms2Z),
        .drv_ms3(ms3Z),
        .drv_reset(resetZ),
        .drv_step(stepZ),
        .enable(DriverController_Y_en),
        .ms1(xlconstant_1_dout),
        .ms2(xlconstant_1_dout),
        .ms3(xlconstant_1_dout),
        .reset(ResetSwitch),
        .step(DriverController_Y_step));
  CNC_Top_A4988_Driver_IO_2 A4988_Driver_IO2
       (.direction(DriverController_Z_dir_out),
        .drv_direction(directionY),
        .drv_enable(enableY),
        .drv_ms1(ms1Y),
        .drv_ms2(ms2Y),
        .drv_ms3(ms3Y),
        .drv_reset(resetY),
        .drv_step(stepY),
        .enable(DriverController_Z_en),
        .ms1(xlconstant_1_dout),
        .ms2(xlconstant_1_dout),
        .ms3(xlconstant_1_dout),
        .reset(ResetSwitch),
        .step(DriverController_Z_step));
  CNC_Top_Buttons_Vector_0_1 Buttons_Vector_0
       (.Zswitch(Zswitch),
        .down(Down),
        .keys(Buttons_Vector_0_keys),
        .left(Left),
        .right(Right),
        .up(Up));
  CNC_Top_DriverController_0_0 DriverController_X
       (.clk(clk_wiz_clk_out1),
        .cycles_per_step(XYZ_Axis_Coordinator_0_cycles_per_step_x),
        .dir(XYZ_Axis_Coordinator_0_dir_x),
        .dir_out(DriverController_X_dir_out),
        .en(DriverController_0_en),
        .hold(GCODE_Parser_0_enable),
        .rst(ResetSwitch),
        .step(DriverController_0_step),
        .step_risingedge(DriverController_X_step_risingedge));
  CNC_Top_DriverController_X_0 DriverController_Y
       (.clk(clk_wiz_clk_out1),
        .cycles_per_step(XYZ_Axis_Coordinator_0_cycles_per_step_y),
        .dir(XYZ_Axis_Coordinator_0_dir_y),
        .dir_out(DriverController_Y_dir_out),
        .en(DriverController_Y_en),
        .hold(GCODE_Parser_0_enable),
        .rst(ResetSwitch),
        .step(DriverController_Y_step),
        .step_risingedge(DriverController_X1_step_risingedge));
  CNC_Top_DriverController_X_1 DriverController_Z
       (.clk(clk_wiz_clk_out1),
        .cycles_per_step(XYZ_Axis_Coordinator_0_cycles_per_step_z),
        .dir(XYZ_Axis_Coordinator_0_dir_z),
        .dir_out(DriverController_Z_dir_out),
        .en(DriverController_Z_en),
        .hold(GCODE_Parser_0_enable),
        .rst(ResetSwitch),
        .step(DriverController_Z_step),
        .step_risingedge(DriverController_X2_step_risingedge));
  CNC_Top_GCODE_Parser_0_0 GCODE_Parser_0
       (.clk(clk_wiz_clk_out1),
        .cmd_last(GcodeFetcher_0_cmd_last),
        .cmd_pos_x(GcodeFetcher_0_cmd_pos_x),
        .cmd_pos_y(GcodeFetcher_0_cmd_pos_y),
        .cmd_pos_z(GcodeFetcher_0_cmd_pos_z),
        .cmd_ready(GCODE_Parser_0_cmd_ready),
        .cmd_speed(GcodeFetcher_0_cmd_speed),
        .cmd_valid(GcodeFetcher_0_cmd_valid),
        .enable(GCODE_Parser_0_enable),
        .load_next_line(XYZ_Axis_Coordinator_0_load_next_line),
        .next_pos_x(GCODE_Parser_0_next_pos_x),
        .next_pos_y(GCODE_Parser_0_next_pos_y),
        .next_pos_z(GCODE_Parser_0_next_pos_z),
        .next_speed(GCODE_Parser_0_next_speed),
        .rewind(GCODE_Parser_0_rewind),
        .rst(ResetSwitch),
        .start(Middle));
  CNC_Top_GcodeFetcher_0_0 GcodeFetcher_0
       (.clk(clk_wiz_clk_out1),
        .cmd_last(GcodeFetcher_0_cmd_last),
        .cmd_pos_x(GcodeFetcher_0_cmd_pos_x),
        .cmd_pos_y(GcodeFetcher_0_cmd_pos_y),
        .cmd_pos_z(GcodeFetcher_0_cmd_pos_z),
        .cmd_ready(GCODE_Parser_0_cmd_ready),
        .cmd_speed(GcodeFetcher_0_cmd_speed),
        .cmd_valid(GcodeFetcher_0_cmd_valid),
        .rewind(GCODE_Parser_0_rewind),
        .rst(ResetSwitch));
  CNC_Top_xlconstant_0_1 High_Bit
       (.dout(xlconstant_1_dout));
  CNC_Top_LED_IO_0_0 LED_IO_0
       (.in0(enableX),
        .in1(directionX),
        .in2(stepX),
        .in3(xlconstant_1_dout),
        .in4(xlconstant_1_dout),
        .in5(XYZ_Axis_Coordinator_0_load_next_line),
        .in6(xlconstant_1_dout),
        .in7(GCODE_Parser_0_enable),
        .led(led));
  CNC_Top_XYZ_Axis_Coordinator_0_0 XYZ_Axis_Coordinator_0
       (.clk(clk_wiz_clk_out1),
        .current_speed(XYZ_Axis_Coordinator_0_current_speed),
        .cycles_per_step_x(XYZ_Axis_Coordinator_0_cycles_per_step_x),
        .cycles_per_step_y(XYZ_Axis_Coordinator_0_cycles_per_step_y),
        .cycles_per_step_z(XYZ_Axis_Coordinator_0_cycles_per_step_z),
        .direction_change_buffer(XYZ_Axis_Coordinator_0_direction_change_buffer),
        .enable(GCODE_Parser_0_enable),
        .load_next_line(XYZ_Axis_Coordinator_0_load_next_line),
        .manual_move(Buttons_Vector_0_keys),
        .motor_dir_x(XYZ_Axis_Coordinator_0_dir_x),
        .motor_dir_y(XYZ_Axis_Coordinator_0_dir_y),
        .motor_dir_z(XYZ_Axis_Coordinator_0_dir_z),
        .next_pos_x(GCODE_Parser_0_next_pos_x),
        .next_pos_y(GCODE_Parser_0_next_pos_y),
        .next_pos_z(GCODE_Parser_0_next_pos_z),
        .next_speed(GCODE_Parser_0_next_speed),
        .rst(ResetSwitch),
        .step_feedback_x(DriverController_X_step_risingedge),
        .step_feedback_y(DriverController_X1_step_risingedge),
        .step_feedback_z(DriverController_X2_step_risingedge),
        .target_speed(XYZ_Axis_Coordinator_0_target_speed));
  CNC_Top_clk_wiz_0 clk_wiz
       (.clk_in1(sys_clock),
        .clk_out1(clk_wiz_clk_out1),
        .reset(1'b0));
  CNC_Top_vio_0_0 vio_0
       (.clk(clk_wiz_clk_out1),
        .probe_in0(XYZ_Axis_Coordinator_0_current_speed),
        .probe_in1(XYZ_Axis_Coordinator_0_target_speed),
        .probe_in2(XYZ_Axis_Coordinator_0_direction_change_buffer),
        .probe_in3(Buttons_Vector_0_keys));
endmodule
