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
    input [31:0] next_pos_x,
    input [31:0] next_pos_y,
    input [31:0] next_pos_z,
    input step_feedback_x,
    input step_feedback_y,
    input step_feedback_z,
    
    //Outputs
    output reg [63:0] cycles_per_step_x,
    output reg dir_x,
    output reg [63:0] cycles_per_step_y,
    output reg dir_y,
    output reg [63:0] cycles_per_step_z,
    output reg dir_z,
    output reg line_finished,
    output reg signed [31:0] curr_pos_x,
    output reg signed [31:0] curr_pos_y,
    output reg signed [31:0] curr_pos_z,
    output reg signed [31:0] start_pos_x,
    output reg signed [31:0] start_pos_y,
    output reg signed [31:0] start_pos_z,
    output reg [31:0] clk_counter,
    output reg position_reached,
    output reg signed [31:0] target_pos_x,
    output reg signed [31:0] target_pos_y,
    output reg signed [31:0] target_pos_z,
    output reg [2:0] state,       
    output reg [31:0] state_timer
    
);
    
    //Constants
    localparam MIN_SPEED = 1;
    localparam MAX_SPEED = 60;
    localparam CYCLES_PER_SECOND = 100000000;
    localparam MICRONS_PER_STEP_X = 20;
    localparam MICRONS_PER_STEP_Y = 20;
    localparam MICRONS_PER_STEP_Z = 5;
    //localparam MIN_HALF_STEP_WIDTH = 1500;
    //each full step is 1/200 of a rotation (1.8 degrees) * 2pi * R(in mm * 1000). 
    //defaulting to the motor shaft diameter of 5000 microns (5mm).
    
    //State registers
    //reg [31:0] target_pos_x;
    //reg [31:0] target_pos_y;
    //reg [31:0] target_pos_z;
    
    //reg [31:0] curr_pos_x;
    //reg [31:0] curr_pos_y;
    //reg [31:0] curr_pos_z;
    
    //Statemachine values
    localparam LOAD     = 0;
    localparam CALC_1   = 1;
    localparam CALC_2   = 2;
    localparam CALC_3   = 3;
    localparam MOVE     = 4;
    //localparam DONE     = 5;
    
    //reg [2:0] state;
    //reg [31:0] state_timer;
    //reg [31:0] clk_counter;
    //reg x_reached, y_reached, z_reached, position_reached;
   
    reg [63:0] next_num_clk_cycles;
    
    wire [31:0] distance_x, distance_y, distance_z;
    wire [63:0] squared_distance;
    reg squareroot_start, squareroot_running, result_ready;
    reg [31:0] distance;
    
    reg x_reached, y_reached, z_reached;
    
    assign distance_x = (target_pos_x >= start_pos_x) ? (target_pos_x - start_pos_x) : (start_pos_x - target_pos_x);
    assign distance_y = (target_pos_y >= start_pos_y) ? (target_pos_y - start_pos_y) : (start_pos_y - target_pos_y);
    assign distance_z = (target_pos_z >= start_pos_z) ? (target_pos_z - start_pos_z) : (start_pos_z - target_pos_z);
    assign squared_distance = (distance_x * distance_x) + (distance_y * distance_y) + (distance_z * distance_z);
    
    always @* begin
        x_reached = (curr_pos_x > target_pos_x - MICRONS_PER_STEP_X && curr_pos_x < target_pos_x + MICRONS_PER_STEP_X);
        y_reached = (curr_pos_y > target_pos_y - MICRONS_PER_STEP_Y && curr_pos_y < target_pos_y + MICRONS_PER_STEP_Y);
        z_reached = (curr_pos_z > target_pos_z - MICRONS_PER_STEP_Z && curr_pos_z < target_pos_z + MICRONS_PER_STEP_Z);
    end
    
    always @(posedge clk) begin
        if(rst || !enable) begin
            state <= LOAD;
            clk_counter <= 0;
            state_timer <= 1*CYCLES_PER_SECOND;
            next_num_clk_cycles <= 0;
            
            target_pos_x <= 0;
            target_pos_y <= 0;
            target_pos_z <= 0;
            
            dir_x <= 0;
            dir_y <= 0;
            dir_z <= 0;
            
            cycles_per_step_x <= 0;
            cycles_per_step_y <= 0; 
            cycles_per_step_z <= 0; 
            
            squareroot_start <= 0;
            
            curr_pos_x <= 0;
            curr_pos_y <= 0;
            curr_pos_z <= 0;
            start_pos_x <= 0;
            start_pos_y <= 0;
            start_pos_z <= 0;
            position_reached <= 0;
            
            line_finished <= 0;
        end else begin
            squareroot_start <= 0;
            line_finished <= 0;
            case (state)
                LOAD    : begin
                    target_pos_x <= next_pos_x;
                    target_pos_y <= next_pos_y;
                    target_pos_z <= next_pos_z;
                    
                    start_pos_x <= curr_pos_x;
                    start_pos_y <= curr_pos_y;
                    start_pos_z <= curr_pos_z;
                    
                    dir_x <= (next_pos_x >= curr_pos_x) ? 0 : 1;
                    dir_y <= (next_pos_y >= curr_pos_y) ? 0 : 1;
                    dir_z <= (next_pos_z >= curr_pos_z) ? 0 : 1;
                    
                    if (clk_counter < state_timer) begin
                        clk_counter <= clk_counter + 1;
                    end else begin
                        squareroot_start <= 1;
                        clk_counter <= 0;
                        state <= CALC_1;
                    end
                end
                
                CALC_1  : begin
                    //squareroot_start <= (clk_counter == 0);         
                    if (result_ready) begin
                        state <= CALC_2;
                    end
                end
                
                CALC_2  : begin
                    if (next_speed >= MIN_SPEED) begin
                        if (next_speed <= MAX_SPEED) begin
                            next_num_clk_cycles <= (distance * 100000) / next_speed;
                        end else begin
                            next_num_clk_cycles <= (distance * 100000) / MAX_SPEED;
                        end
                    end else begin
                        next_num_clk_cycles <= (distance * 100000) / MIN_SPEED;
                    end
                    state <= CALC_3;
                end
                
                CALC_3  : begin
                    cycles_per_step_x <= (distance_x > 0) ? ((next_num_clk_cycles * MICRONS_PER_STEP_X) / distance_x) : 0;
                    cycles_per_step_y <= (distance_y > 0) ? ((next_num_clk_cycles * MICRONS_PER_STEP_Y) / distance_y) : 0;
                    cycles_per_step_z <= (distance_z > 0) ? ((next_num_clk_cycles * MICRONS_PER_STEP_Z) / distance_z) : 0;
                    
                    clk_counter <= 0;
                    state_timer <= 10*CYCLES_PER_SECOND;
                    state <= MOVE;
                end
                
                MOVE    : begin
                    if (step_feedback_x) curr_pos_x <= curr_pos_x + (dir_x ? -MICRONS_PER_STEP_X : MICRONS_PER_STEP_X);
                    if (step_feedback_y) curr_pos_y <= curr_pos_y + (dir_y ? -MICRONS_PER_STEP_Y : MICRONS_PER_STEP_Y);
                    if (step_feedback_z) curr_pos_z <= curr_pos_z + (dir_z ? -MICRONS_PER_STEP_Z : MICRONS_PER_STEP_Z);
                    
                    if (x_reached) cycles_per_step_x <= 0;
                    if (y_reached) cycles_per_step_y <= 0;
                    if (z_reached) cycles_per_step_z <= 0;
                    
                    if (clk_counter >= state_timer || (x_reached && y_reached && z_reached)) begin
                        clk_counter <= 0;
                        state_timer <= 10;
                        line_finished <= 1;
                        state <= LOAD;
                    end else begin
                        clk_counter <= clk_counter + 1;
                    end
                end
            endcase
        end
    end
    
    //Iterative function for square root
    reg [63:0] val, res, bit;
    reg [6:0] i;
    
    always @(posedge clk) begin
        if (rst || !enable) begin
            val <= 0;
            res <= 0;
            bit <= 0;
            i <= 0;
            distance <= 0;
            squareroot_running <= 0;
            result_ready <= 0;
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
                    distance <= res;
                    squareroot_running <= 0;
                    result_ready <= 1;
                end
            end
        end
    end
    



endmodule
