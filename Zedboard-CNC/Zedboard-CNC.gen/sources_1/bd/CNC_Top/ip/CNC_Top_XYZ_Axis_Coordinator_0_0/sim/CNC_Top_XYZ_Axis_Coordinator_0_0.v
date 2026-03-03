// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:XYZ_Axis_Coordinator:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module CNC_Top_XYZ_Axis_Coordinator_0_0 (
  clk,
  rst,
  enable,
  next_speed,
  next_pos_x,
  next_pos_y,
  next_pos_z,
  step_feedback_x,
  step_feedback_y,
  step_feedback_z,
  manual_move,
  cycles_per_step_x,
  cycles_per_step_y,
  cycles_per_step_z,
  motor_dir_x,
  motor_dir_y,
  motor_dir_z,
  load_next_line,
  curr_pos_x,
  curr_pos_y,
  curr_pos_z,
  start_pos_x,
  start_pos_y,
  start_pos_z,
  position_reached,
  target_pos_x,
  target_pos_y,
  target_pos_z,
  distance_x,
  distance_y,
  distance_z,
  current_speed,
  target_speed,
  direction_change_buffer,
  passed_midpoint
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *)
input wire clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rst RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
input wire rst;
input wire enable;
input wire [7 : 0] next_speed;
input wire [31 : 0] next_pos_x;
input wire [31 : 0] next_pos_y;
input wire [31 : 0] next_pos_z;
input wire step_feedback_x;
input wire step_feedback_y;
input wire step_feedback_z;
input wire [5 : 0] manual_move;
output wire [63 : 0] cycles_per_step_x;
output wire [63 : 0] cycles_per_step_y;
output wire [63 : 0] cycles_per_step_z;
output wire motor_dir_x;
output wire motor_dir_y;
output wire motor_dir_z;
output wire load_next_line;
output wire [31 : 0] curr_pos_x;
output wire [31 : 0] curr_pos_y;
output wire [31 : 0] curr_pos_z;
output wire [31 : 0] start_pos_x;
output wire [31 : 0] start_pos_y;
output wire [31 : 0] start_pos_z;
output wire position_reached;
output wire [31 : 0] target_pos_x;
output wire [31 : 0] target_pos_y;
output wire [31 : 0] target_pos_z;
output wire [31 : 0] distance_x;
output wire [31 : 0] distance_y;
output wire [31 : 0] distance_z;
output wire [7 : 0] current_speed;
output wire [7 : 0] target_speed;
output wire [31 : 0] direction_change_buffer;
output wire passed_midpoint;

  XYZ_Axis_Coordinator inst (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .next_speed(next_speed),
    .next_pos_x(next_pos_x),
    .next_pos_y(next_pos_y),
    .next_pos_z(next_pos_z),
    .step_feedback_x(step_feedback_x),
    .step_feedback_y(step_feedback_y),
    .step_feedback_z(step_feedback_z),
    .manual_move(manual_move),
    .cycles_per_step_x(cycles_per_step_x),
    .cycles_per_step_y(cycles_per_step_y),
    .cycles_per_step_z(cycles_per_step_z),
    .motor_dir_x(motor_dir_x),
    .motor_dir_y(motor_dir_y),
    .motor_dir_z(motor_dir_z),
    .load_next_line(load_next_line),
    .curr_pos_x(curr_pos_x),
    .curr_pos_y(curr_pos_y),
    .curr_pos_z(curr_pos_z),
    .start_pos_x(start_pos_x),
    .start_pos_y(start_pos_y),
    .start_pos_z(start_pos_z),
    .position_reached(position_reached),
    .target_pos_x(target_pos_x),
    .target_pos_y(target_pos_y),
    .target_pos_z(target_pos_z),
    .distance_x(distance_x),
    .distance_y(distance_y),
    .distance_z(distance_z),
    .current_speed(current_speed),
    .target_speed(target_speed),
    .direction_change_buffer(direction_change_buffer),
    .passed_midpoint(passed_midpoint)
  );
endmodule
