/////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Zuabi
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
	input cw,
	input ccw,
	//outputs
	output en,
	output reg dir,
	output reg step
    );


	wire active = cw || ccw;
	assign en = active;
	reg [19:0] clk_div;
	always @(posedge clk) begin
		clk_div <= clk_div + 1;

		if(active) begin
			step <= clk_div[19]; // 95Hz
			dir <= ccw;
		end
		else begin
			step <= 0;
		end
	end
endmodule
