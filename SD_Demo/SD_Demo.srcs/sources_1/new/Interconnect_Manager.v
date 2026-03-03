`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 12/25/2025 08:22:43 PM
// Design Name:
// Module Name: Interconnect Manager
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module Interconnect_Manager(
    input [31:0] X,
    input [31:0] Y,
    input [15:0] Z,
    input [7:0] CMD,
    input [7:0] PS_Channel,
    input switch0,
    output [7:0] PL_Channel,
    output [7:0] led
    );

    // Turn on LEDs when corresponding channel is non-zero.
    // led[0]=X, led[1]=Y, led[2]=Z, led[3]=CMD, led[4]=PS_Channel.
    assign led[0]   = (X          != 32'd0);
    assign led[1]   = (Y          != 32'd0);
    assign led[2]   = (Z          != 16'd0);
    assign led[3]   = (CMD        != 8'd0);
    assign led[4]   = (PS_Channel != 8'd0);
    assign led[7:5] = 3'b000;

    // When switch is high, drive PL_Channel with 1 for a simple loopback test.
    assign PL_Channel = switch0 ? 8'h01 : 8'h00;

endmodule
