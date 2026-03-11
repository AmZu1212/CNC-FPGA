// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Mar  5 13:26:46 2026
// Host        : OBSIDIAN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/Git-Repos/CNC-FPGA/SD_Demo/SD_Demo.gen/sources_1/bd/SD_System/ip/SD_System_Interconnect_Manager_0_0/SD_System_Interconnect_Manager_0_0_stub.v
// Design      : SD_System_Interconnect_Manager_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "SD_System_Interconnect_Manager_0_0,Interconnect_Manager,{}" *) (* CORE_GENERATION_INFO = "SD_System_Interconnect_Manager_0_0,Interconnect_Manager,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=Interconnect_Manager,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "Interconnect_Manager,Vivado 2024.2" *) 
module SD_System_Interconnect_Manager_0_0(X, Y, Z, CMD, PS_Channel, switch0, PL_Channel, led)
/* synthesis syn_black_box black_box_pad_pin="X[31:0],Y[31:0],Z[31:0],CMD[7:0],PS_Channel[7:0],switch0,PL_Channel[7:0],led[7:0]" */;
  input [31:0]X;
  input [31:0]Y;
  input [31:0]Z;
  input [7:0]CMD;
  input [7:0]PS_Channel;
  input switch0;
  output [7:0]PL_Channel;
  output [7:0]led;
endmodule
