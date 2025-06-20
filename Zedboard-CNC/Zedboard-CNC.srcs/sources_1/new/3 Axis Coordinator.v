`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Alex Vasilayev
// 
// Create Date: 06/20/2025 12:17:40 PM
// Design Name: 
// Module Name: 3_Axis_Coordinator
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



module 3_Axis_Coordinator(
    input clk,
    input [7:0] next_speed,
    input [7:0] next_x_pos,
    input [7:0] next_y_pos,
    input [7:0] next_z_pos,
    output x_dir,
    output y_dir,
    output z_dir,
    output [31:0] x_pulse_rate,
    output [31:0] y_pulse_rate,
    output [31:0] z_pulse_rate,
    output done
    );
    
    //distance / speed = time[sec] = cycles / 100M
    //speed = distance / second = distance / 100,000,000 cycles
    //
    
    
    //cycles = distance*100M/speed
    //cycles^2 = distance^2*100M^2/speed^2 //mm or microns will give same result


    
    localparam microns_per_step = 79;
    //each full step is 1/200 of a rotation (1.8 degrees) * 2pi * R(in mm * 1000). 
    //defaulting to the motor shaft diameter of 5000 microns (5mm).
    
    reg [7:0] curr_x_pos;
    reg [7:0] curr_y_pos;
    reg [7:0] curr_z_pos;
    reg [7:0] next_x_pulse_rate;
    reg [7:0] next_y_pulse_rate;
    reg [7:0] next_z_pulse_rate;
    reg [63:0] squared_distance_to_next;
    reg [63:0] squared_cycles_to_next;
    
    squared_num
    attempt = 0;
    a^2 - b^2 = (a+b)(a-b)
    
    
    
    always comb begin
        squared_distance_to_next = (((next_x_pos-curr_x_pos) * (next_x_pos-curr_x_pos))
         + ((next_y_pos-curr_y_pos) * (next_y_pos-curr_y_pos)) 
         + ((next_z_pos-curr_z_pos) * (next_z_pos-curr_z_pos))); //calculated in mm^2.
        
        squared_cycles_to_next = 
    end
    
    
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
