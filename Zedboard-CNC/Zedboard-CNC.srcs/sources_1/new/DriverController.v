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
	input [63:0] cycles_per_step,
	input dir,
	input hold,
    
	//outputs
	output reg en,
	output reg dir_out,
	output reg step,
	output reg step_risingedge
    );
    
    localparam STEP_WIDTH = 3000;
	wire active = (cycles_per_step > 0);
	
	reg [63:0] clk_counter;
	//reg [63:0] cycle_target;
	wire [63:0] cycle_count;
	assign cycle_count = (cycles_per_step < (STEP_WIDTH)) ? (STEP_WIDTH) : (cycles_per_step);
    
	always @(posedge clk) begin
	   dir_out <= dir;
	   if(rst) begin
	       clk_counter <= 0;
	       en <= hold;
	       step <= 0;
	       step_risingedge <= 0;
	   end else begin
	       en <= (hold || active);
	       if((clk_counter < cycle_count) && active) begin
	           clk_counter <= clk_counter + 1;
	           step <= (clk_counter  < (cycle_count >> 1));// ? 1 : 0
	           step_risingedge <= 0;
	       end else begin
	           clk_counter <= 0;
	           step <= 0;
	           step_risingedge <= active;
	       end
	   end
	end
endmodule
