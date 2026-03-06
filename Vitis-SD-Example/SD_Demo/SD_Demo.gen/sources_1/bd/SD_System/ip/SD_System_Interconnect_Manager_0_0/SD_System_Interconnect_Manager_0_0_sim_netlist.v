// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Thu Mar  5 13:26:46 2026
// Host        : OBSIDIAN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               e:/Git-Repos/CNC-FPGA/SD_Demo/SD_Demo.gen/sources_1/bd/SD_System/ip/SD_System_Interconnect_Manager_0_0/SD_System_Interconnect_Manager_0_0_sim_netlist.v
// Design      : SD_System_Interconnect_Manager_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SD_System_Interconnect_Manager_0_0,Interconnect_Manager,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "Interconnect_Manager,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module SD_System_Interconnect_Manager_0_0
   (X,
    Y,
    Z,
    CMD,
    PS_Channel,
    switch0,
    PL_Channel,
    led);
  input [31:0]X;
  input [31:0]Y;
  input [31:0]Z;
  input [7:0]CMD;
  input [7:0]PS_Channel;
  input switch0;
  output [7:0]PL_Channel;
  output [7:0]led;

  wire \<const0> ;
  wire [7:0]CMD;
  wire [7:0]PS_Channel;
  wire [31:0]X;
  wire [31:0]Y;
  wire [31:0]Z;
  wire [4:0]\^led ;
  wire switch0;

  assign PL_Channel[7] = \<const0> ;
  assign PL_Channel[6] = \<const0> ;
  assign PL_Channel[5] = \<const0> ;
  assign PL_Channel[4] = \<const0> ;
  assign PL_Channel[3] = \<const0> ;
  assign PL_Channel[2] = \<const0> ;
  assign PL_Channel[1] = \<const0> ;
  assign PL_Channel[0] = switch0;
  assign led[7] = \<const0> ;
  assign led[6] = \<const0> ;
  assign led[5] = \<const0> ;
  assign led[4:0] = \^led [4:0];
  GND GND
       (.G(\<const0> ));
  SD_System_Interconnect_Manager_0_0_Interconnect_Manager inst
       (.CMD(CMD),
        .PS_Channel(PS_Channel),
        .X(X),
        .Y(Y),
        .Z(Z),
        .led(\^led ));
endmodule

(* ORIG_REF_NAME = "Interconnect_Manager" *) 
module SD_System_Interconnect_Manager_0_0_Interconnect_Manager
   (led,
    X,
    Y,
    Z,
    CMD,
    PS_Channel);
  output [4:0]led;
  input [31:0]X;
  input [31:0]Y;
  input [31:0]Z;
  input [7:0]CMD;
  input [7:0]PS_Channel;

  wire [7:0]CMD;
  wire [7:0]PS_Channel;
  wire [31:0]X;
  wire [31:0]Y;
  wire [31:0]Z;
  wire [4:0]led;
  wire \led0_inferred__0/led[1]_INST_0_i_1_n_0 ;
  wire \led0_inferred__0/led[1]_INST_0_i_2_n_0 ;
  wire \led0_inferred__0/led[1]_INST_0_i_3_n_0 ;
  wire \led0_inferred__0/led[1]_INST_0_i_4_n_0 ;
  wire \led0_inferred__0/led[1]_INST_0_i_5_n_0 ;
  wire \led0_inferred__0/led[1]_INST_0_i_6_n_0 ;
  wire \led0_inferred__1/led[2]_INST_0_i_1_n_0 ;
  wire \led0_inferred__1/led[2]_INST_0_i_2_n_0 ;
  wire \led0_inferred__1/led[2]_INST_0_i_3_n_0 ;
  wire \led0_inferred__1/led[2]_INST_0_i_4_n_0 ;
  wire \led0_inferred__1/led[2]_INST_0_i_5_n_0 ;
  wire \led0_inferred__1/led[2]_INST_0_i_6_n_0 ;
  wire \led0_inferred__2/led[3]_INST_0_i_1_n_0 ;
  wire \led0_inferred__3/led[4]_INST_0_i_1_n_0 ;
  wire \led[0]_INST_0_i_1_n_0 ;
  wire \led[0]_INST_0_i_2_n_0 ;
  wire \led[0]_INST_0_i_3_n_0 ;
  wire \led[0]_INST_0_i_4_n_0 ;
  wire \led[0]_INST_0_i_5_n_0 ;
  wire \led[0]_INST_0_i_6_n_0 ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__0/led[1]_INST_0 
       (.I0(\led0_inferred__0/led[1]_INST_0_i_1_n_0 ),
        .I1(\led0_inferred__0/led[1]_INST_0_i_2_n_0 ),
        .I2(\led0_inferred__0/led[1]_INST_0_i_3_n_0 ),
        .I3(\led0_inferred__0/led[1]_INST_0_i_4_n_0 ),
        .I4(\led0_inferred__0/led[1]_INST_0_i_5_n_0 ),
        .I5(\led0_inferred__0/led[1]_INST_0_i_6_n_0 ),
        .O(led[1]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__0/led[1]_INST_0_i_1 
       (.I0(Y[12]),
        .I1(Y[13]),
        .I2(Y[10]),
        .I3(Y[11]),
        .I4(Y[9]),
        .I5(Y[8]),
        .O(\led0_inferred__0/led[1]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__0/led[1]_INST_0_i_2 
       (.I0(Y[18]),
        .I1(Y[19]),
        .I2(Y[16]),
        .I3(Y[17]),
        .I4(Y[15]),
        .I5(Y[14]),
        .O(\led0_inferred__0/led[1]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__0/led[1]_INST_0_i_3 
       (.I0(Y[30]),
        .I1(Y[31]),
        .I2(Y[28]),
        .I3(Y[29]),
        .I4(Y[27]),
        .I5(Y[26]),
        .O(\led0_inferred__0/led[1]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__0/led[1]_INST_0_i_4 
       (.I0(Y[24]),
        .I1(Y[25]),
        .I2(Y[22]),
        .I3(Y[23]),
        .I4(Y[21]),
        .I5(Y[20]),
        .O(\led0_inferred__0/led[1]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \led0_inferred__0/led[1]_INST_0_i_5 
       (.I0(Y[0]),
        .I1(Y[1]),
        .O(\led0_inferred__0/led[1]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__0/led[1]_INST_0_i_6 
       (.I0(Y[6]),
        .I1(Y[7]),
        .I2(Y[4]),
        .I3(Y[5]),
        .I4(Y[3]),
        .I5(Y[2]),
        .O(\led0_inferred__0/led[1]_INST_0_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__1/led[2]_INST_0 
       (.I0(\led0_inferred__1/led[2]_INST_0_i_1_n_0 ),
        .I1(\led0_inferred__1/led[2]_INST_0_i_2_n_0 ),
        .I2(\led0_inferred__1/led[2]_INST_0_i_3_n_0 ),
        .I3(\led0_inferred__1/led[2]_INST_0_i_4_n_0 ),
        .I4(\led0_inferred__1/led[2]_INST_0_i_5_n_0 ),
        .I5(\led0_inferred__1/led[2]_INST_0_i_6_n_0 ),
        .O(led[2]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__1/led[2]_INST_0_i_1 
       (.I0(Z[12]),
        .I1(Z[13]),
        .I2(Z[10]),
        .I3(Z[11]),
        .I4(Z[9]),
        .I5(Z[8]),
        .O(\led0_inferred__1/led[2]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__1/led[2]_INST_0_i_2 
       (.I0(Z[18]),
        .I1(Z[19]),
        .I2(Z[16]),
        .I3(Z[17]),
        .I4(Z[15]),
        .I5(Z[14]),
        .O(\led0_inferred__1/led[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__1/led[2]_INST_0_i_3 
       (.I0(Z[30]),
        .I1(Z[31]),
        .I2(Z[28]),
        .I3(Z[29]),
        .I4(Z[27]),
        .I5(Z[26]),
        .O(\led0_inferred__1/led[2]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__1/led[2]_INST_0_i_4 
       (.I0(Z[24]),
        .I1(Z[25]),
        .I2(Z[22]),
        .I3(Z[23]),
        .I4(Z[21]),
        .I5(Z[20]),
        .O(\led0_inferred__1/led[2]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \led0_inferred__1/led[2]_INST_0_i_5 
       (.I0(Z[0]),
        .I1(Z[1]),
        .O(\led0_inferred__1/led[2]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led0_inferred__1/led[2]_INST_0_i_6 
       (.I0(Z[6]),
        .I1(Z[7]),
        .I2(Z[4]),
        .I3(Z[5]),
        .I4(Z[3]),
        .I5(Z[2]),
        .O(\led0_inferred__1/led[2]_INST_0_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \led0_inferred__2/led[3]_INST_0 
       (.I0(CMD[0]),
        .I1(CMD[1]),
        .I2(CMD[2]),
        .I3(CMD[3]),
        .I4(\led0_inferred__2/led[3]_INST_0_i_1_n_0 ),
        .O(led[3]));
  LUT4 #(
    .INIT(16'h0001)) 
    \led0_inferred__2/led[3]_INST_0_i_1 
       (.I0(CMD[6]),
        .I1(CMD[7]),
        .I2(CMD[5]),
        .I3(CMD[4]),
        .O(\led0_inferred__2/led[3]_INST_0_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFEFFFF)) 
    \led0_inferred__3/led[4]_INST_0 
       (.I0(PS_Channel[0]),
        .I1(PS_Channel[1]),
        .I2(PS_Channel[2]),
        .I3(PS_Channel[3]),
        .I4(\led0_inferred__3/led[4]_INST_0_i_1_n_0 ),
        .O(led[4]));
  LUT4 #(
    .INIT(16'h0001)) 
    \led0_inferred__3/led[4]_INST_0_i_1 
       (.I0(PS_Channel[6]),
        .I1(PS_Channel[7]),
        .I2(PS_Channel[5]),
        .I3(PS_Channel[4]),
        .O(\led0_inferred__3/led[4]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[0]_INST_0 
       (.I0(\led[0]_INST_0_i_1_n_0 ),
        .I1(\led[0]_INST_0_i_2_n_0 ),
        .I2(\led[0]_INST_0_i_3_n_0 ),
        .I3(\led[0]_INST_0_i_4_n_0 ),
        .I4(\led[0]_INST_0_i_5_n_0 ),
        .I5(\led[0]_INST_0_i_6_n_0 ),
        .O(led[0]));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[0]_INST_0_i_1 
       (.I0(X[12]),
        .I1(X[13]),
        .I2(X[10]),
        .I3(X[11]),
        .I4(X[9]),
        .I5(X[8]),
        .O(\led[0]_INST_0_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[0]_INST_0_i_2 
       (.I0(X[18]),
        .I1(X[19]),
        .I2(X[16]),
        .I3(X[17]),
        .I4(X[15]),
        .I5(X[14]),
        .O(\led[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[0]_INST_0_i_3 
       (.I0(X[30]),
        .I1(X[31]),
        .I2(X[28]),
        .I3(X[29]),
        .I4(X[27]),
        .I5(X[26]),
        .O(\led[0]_INST_0_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[0]_INST_0_i_4 
       (.I0(X[24]),
        .I1(X[25]),
        .I2(X[22]),
        .I3(X[23]),
        .I4(X[21]),
        .I5(X[20]),
        .O(\led[0]_INST_0_i_4_n_0 ));
  LUT2 #(
    .INIT(4'hE)) 
    \led[0]_INST_0_i_5 
       (.I0(X[0]),
        .I1(X[1]),
        .O(\led[0]_INST_0_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    \led[0]_INST_0_i_6 
       (.I0(X[6]),
        .I1(X[7]),
        .I2(X[4]),
        .I3(X[5]),
        .I4(X[3]),
        .I5(X[2]),
        .O(\led[0]_INST_0_i_6_n_0 ));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
