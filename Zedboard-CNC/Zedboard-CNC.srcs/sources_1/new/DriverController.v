/////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Zuabi & Alex Vassiliev
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
	input [63:0] cycles_per_step,
	input enable,
	input dir,

	//outputs
	output reg en,
	output reg step,
	output reg step_risingedge,
	output reg dir_out
    );

    localparam STEP_WIDTH = 3000;
	wire active = (cycles_per_step > 0); //(cycles_per_step > 0) ? enable : 0;
	
	reg [63:0] clk_counter;
	wire [63:0] cycle_count;
	assign cycle_count = (cycles_per_step < (STEP_WIDTH)) ? (STEP_WIDTH) : (cycles_per_step);

	always @(posedge clk) begin
	   dir_out <= dir;
	   if(rst || !enable || !active) begin
	   //"reset" start
	       clk_counter <= 0;
	       en <= 0;
	       step <= 0;
	       step_risingedge <= 0;
	   //"reset" end
	   end else begin
	       //en <= 1;
	       if(sync) begin
               clk_counter <= 0;
               en <= 1;
               step <= 1;
               step_risingedge <= 0;
	       end else begin
	           if(clk_counter < cycle_count) begin
	           //"step cycle running" start
	               clk_counter <= clk_counter + 1;
	               en <= 1;
	               step <= (clk_counter  < (cycle_count >> 1));// ? 1 : 0
	               step_risingedge <= 0;
	           //"step cycle running" end
	           end else begin
	           //"step cycle finished" start
	               clk_counter <= 0;
	               step_risingedge <= 1;
	           //"step cycle finished" end
	           end
	       end
	   end
	end
endmodule
