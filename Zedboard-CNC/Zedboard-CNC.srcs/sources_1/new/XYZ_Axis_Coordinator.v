//////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Zuabi & Alex Vassiliev
// 
// Create Date: 06/20/2025 12:17:40 PM
// Design Name: 
// Module Name: XYZ_Axis_Coordinator
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

module XYZ_Axis_Coordinator(
    //Inputs
    input clk,
    input rst,
    input enable,
    input [7:0] next_speed,
    input [15:0] next_pos_x,
    input [15:0] next_pos_y,
    input [15:0] next_pos_z,
    
    //Outputs
    output reg [63:0] cycles_per_step_x,
    output reg dir_x,
    output reg [63:0] cycles_per_step_y,
    output reg dir_y,
    output reg [63:0] cycles_per_step_z,
    output reg dir_z,
    output reg done
);
    
    // Constants
    parameter MIN_SPEED = 1;
    parameter MAX_SPEED = 60;
    parameter CYCLES_PER_SECOND = 100000000;
    parameter MICRONS_PER_STEP = 79;
    //each full step is 1/200 of a rotation (1.8 degrees) * 2pi * R(in mm * 1000). 
    //defaulting to the motor shaft diameter of 5000 microns (5mm).
    
    // State registers
    reg [15:0] curr_pos_x;
    reg [15:0] curr_pos_y;
    reg [15:0] curr_pos_z;
    
    reg [63:0] clk_counter;
    reg [63:0] num_clk_cycles;
    
    reg [63:0] next_num_clk_cycles;
    reg [63:0] next_cycles_per_step_x;
    reg [63:0] next_cycles_per_step_y;
    reg [63:0] next_cycles_per_step_z;
    
    
    wire [31:0] distance_x, distance_y, distance_z;
    reg [63:0] squared_distance;
    reg squareroot_start, squareroot_running, result_ready;
    reg [31:0] distance;
    
    assign distance_x = (next_pos_x >= curr_pos_x) ? (next_pos_x - curr_pos_x) : (curr_pos_x - next_pos_x);
    assign distance_y = (next_pos_y >= curr_pos_y) ? (next_pos_y - curr_pos_y) : (curr_pos_y - next_pos_y);
    assign distance_z = (next_pos_z >= curr_pos_z) ? (next_pos_z - curr_pos_z) : (curr_pos_z - next_pos_z);
    //distance calculated in microns as most GCODE coordinates are yy.xxx [mm] where 'x' is in microns.
    //but speed is currently in mm/s (note that the feedrate parameter in GCODE is in mm/minute)
    
    
    
    // Combinational logic block
    always @* begin
        squared_distance = (distance_x * distance_x) + (distance_y * distance_y) + (distance_z * distance_z);
        //required cycles = time[seconds] * 100M[cycles/second] = (distance[microns]/(speed[mm/s]*1000)) * 100M = (100000*distance[microns]/(speed[mm])
        if (next_speed >= MIN_SPEED) begin
            if (next_speed <= MAX_SPEED)
                next_num_clk_cycles = (distance * 100000) / next_speed;
            else
                next_num_clk_cycles = (distance * 100000) / MAX_SPEED;
        end else begin
            next_num_clk_cycles = (distance * 100000) / MIN_SPEED;
        end
        
        
        //steps required = distance / microns_per_step;
        //number of cycles per step = (distance_x > 0) ? (next_num_clk_cycles/steps_req_x) : (0);
        next_cycles_per_step_x = (distance_x > 0) ? ((next_num_clk_cycles * MICRONS_PER_STEP) / distance_x) : 0;
        next_cycles_per_step_y = (distance_y > 0) ? ((next_num_clk_cycles * MICRONS_PER_STEP) / distance_y) : 0;
        next_cycles_per_step_z = (distance_z > 0) ? ((next_num_clk_cycles * MICRONS_PER_STEP) / distance_z) : 0;
    end
    
    // Sequential logic block
    always @(posedge clk) begin
        if (rst) begin
        //"reset" start
            clk_counter <= 0;
            num_clk_cycles <= CYCLES_PER_SECOND;
            
            curr_pos_x <= 0;
            curr_pos_y <= 0;
            curr_pos_z <= 0;
            dir_x <= 0;
            dir_y <= 0;
            dir_z <= 0;
            cycles_per_step_x <= 0;
            cycles_per_step_y <= 0;
            cycles_per_step_z <= 0;
            
            done <= 0;
            squareroot_start <= 0;
        //"reset" end
        end else if(enable) begin
            if (clk_counter < num_clk_cycles) begin
            //"command running" start
                clk_counter <= clk_counter + 1;
                done <= 0;
                squareroot_start <= (clk_counter == 500) ? 1 : 0;
            //"command running" end
            end else begin
            //"command finished" start
                if(result_ready) begin
                    //"output ready" start
                    clk_counter <= 0;
                    num_clk_cycles <= next_num_clk_cycles;
                    
                    curr_pos_x <= next_pos_x;
                    curr_pos_y <= next_pos_y;
                    curr_pos_z <= next_pos_z;
                    
                    dir_x <= (next_pos_x >= curr_pos_x) ? 0 : 1;
                    dir_y <= (next_pos_y >= curr_pos_y) ? 0 : 1;
                    dir_z <= (next_pos_z >= curr_pos_z) ? 0 : 1;
                    
                    cycles_per_step_x <= next_cycles_per_step_x;
                    cycles_per_step_y <= next_cycles_per_step_y;
                    cycles_per_step_z <= next_cycles_per_step_z;
                    
                    done <= 1;
                    //"output ready" end
                end else begin
                    //"output not ready" start
                    //if square root result wasn't finished then set output cycles_per_step to 0 which the DriverController treats as pausing the motor
                    cycles_per_step_x <= 0;
                    cycles_per_step_y <= 0;
                    cycles_per_step_z <= 0;
                    //"output not ready" end
                end
            //"command finished" end
            end
        end else begin
            cycles_per_step_x <= 0;
            cycles_per_step_y <= 0;
            cycles_per_step_z <= 0;
            done <= 0;
        end
    end
    
    
    
    // Function for square root
    reg [63:0] val, res, bit;
    reg [6:0] i;
    
    always @(posedge clk) begin
        if (rst) begin
            val <= 0;
            res <= 0;
            bit <= 0;
            i <= 0;
            distance <= 0;
            squareroot_running <= 0;
            result_ready <= 1;
        end else begin
            if (squareroot_start && !squareroot_running) begin
                val <= squared_distance;
                res <= 0;
                bit <= (1 << 62);
                i <= 0;
                squareroot_running <= 1;
                result_ready <= 0;
            end else if (squareroot_running) begin
                if (bit > val) begin
                    bit <= (bit >> 2);
                end else if (i < 32 && bit != 0) begin
                    if (val >= res + bit) begin
                        val <= val - (res + bit);
                        res <= (res >> 1) + bit;
                    end else begin
                        res <= (res >> 1);
                    end
                    bit <= (bit >> 2);
                    i <= i + 1;
                end else begin
                    i <= 32;
                    distance <= res;
                    squareroot_running <= 0;
                    result_ready <= 0;
                end
            end else begin
                if(i > 0) begin
                    i <= i - 1;
                end else begin
                    result_ready <= 1;
                end
            end
        end
    end
    



endmodule
