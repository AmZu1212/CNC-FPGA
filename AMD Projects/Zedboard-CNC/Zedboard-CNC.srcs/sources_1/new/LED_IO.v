/////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Zuabi
// 
// Create Date: 06/18/2025 02:15:31 AM
// Design Name: LED_IO Module
// Module Name: LED_IO
// Project Name: CNC-FPGA
// Target Devices: Zedboard Devkit
// Tool Versions: Vivado 2024.2
// Description: 
// 	Zedboard LED IO Interface
// Dependencies: 
// 	Vivado 2024.2
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
/////////////////////////////////////////////////////////////////////////////////
module LED_IO(
	input in0,
	input in1,
	input in2,
	input in3,
	input in4,
	input in5,
	input in6,
	input in7,
	output [7:0] led
    );

	assign led [0] = in0;
	assign led [1] = in1;
	assign led [2] = in2;
	assign led [3] = in3;
	assign led [4] = in4;
	assign led [5] = in5;
	assign led [6] = in6;
	assign led [7] = in7;

endmodule
