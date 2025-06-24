/////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Vassiliev & Alex Zuabi
// 
// Create Date: 06/18/2025 01:14:28 AM
// Design Name: DriverController Module
// Module Name: DriverController
// Project Name: CNC-FPGA
// Target Devices: Zedboard Devkit
// Tool Versions: Vivado 2024.2
// Description: 
// 	Generic Stepper Driver controller
// Dependencies: 
//  Vivado 2024.2
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
/////////////////////////////////////////////////////////////////////////////////
module DriverController(
	//inputs
	input clk,
	input rst,
	input sync,
	input [31:0] cycles_per_step,
	input dir,

	//outputs
	output reg en,
	output reg dir_out,
	output reg step
    );

    localparam STEP_WIDTH = 1500000;
	wire active = (cycles_per_step > 0) ? 1 : 0;
	
	reg [31:0] clk_counter;
	wire [31:0] cycle_count;
	assign cycle_count = (cycles_per_step > (STEP_WIDTH * 2)) ? (cycles_per_step) : (STEP_WIDTH * 2);

	always @(posedge clk) begin
	   if(rst) begin
	   //reset start
	       clk_counter <= 0;
	       en <= 0;
	       dir_out <= 0;
	       step <= 0;
	   //reset end
	   end else if(sync) begin
	       clk_counter <= 0;
	       en <= active;
	       dir_out <= dir;
	       step <= active;
	   end else begin
	       if(clk_counter < cycle_count) begin
	       //step cycle running start
	           clk_counter <= clk_counter + active;
	           en <= active;
	           dir_out <= dir;
	           step <= (clk_counter  < STEP_WIDTH) ? active : 0;
	       //step cycle running end
	       end else begin
	       //step cycle finished start
	           clk_counter <= 0;
	       //step cycle finished end
	       end
	   end
	end
endmodule
