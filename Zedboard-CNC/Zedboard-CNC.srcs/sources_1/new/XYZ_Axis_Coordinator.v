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
    input [5:0] manual_move,
    
    //Outputs
    output reg [63:0] cycles_per_step_x,
    output reg motor_dir_x,
    output reg [63:0] cycles_per_step_y,
    output reg motor_dir_y,
    output reg [63:0] cycles_per_step_z,
    output reg motor_dir_z,
    output reg load_next_line,
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
    output reg [31:0] state_timer,
    output reg [31:0] distance,
    output [31:0] distance_x,
    output [31:0] distance_y,
    output [31:0] distance_z,
    output reg [63:0] next_num_clk_cycles,
    output [63:0] squared_distance
    
);
    
    //Constants
    localparam MIN_SPEED = 10;
    localparam MAX_SPEED = 100;
    localparam CYCLES_PER_SECOND = 100000000;
    localparam MICRONS_PER_STEP_X = 10; //was 20
    localparam MICRONS_PER_STEP_Y = 10; //was 20
    localparam MICRONS_PER_STEP_Z = 5;
    localparam REVERSE_DIR_X = 0;
    localparam REVERSE_DIR_Y = 0;
    localparam REVERSE_DIR_Z = 0;
    localparam HOMING_SPEED_XY = 2;
    localparam HOMING_SPEED_Z = 1;
    
    
    //1 mm = 1000 microns = [1000/MICRONS_PER_STEP_#] steps
    //'D' mm/second --> 1/D second/mm = 1 second / [D*1000/MICRONS_PER_STEP_#] steps
    // --> 100M clk cycles / [D*1000/MICRONS_PER_STEP_#] steps
    // --> 1 step every [100000/D]*MICRONS_PER_STEP_#
    
    //calculated X/Y separately as MICRONS_PER_STEP can differ
    localparam HOMING_CYCLES_PER_STEP_X = (100000/HOMING_SPEED_XY)*MICRONS_PER_STEP_X;
    localparam HOMING_CYCLES_PER_STEP_Y = (100000/HOMING_SPEED_XY)*MICRONS_PER_STEP_Y;
    localparam HOMING_CYCLES_PER_STEP_Z = (100000/HOMING_SPEED_Z )*MICRONS_PER_STEP_Z;    
    
    
    //State registers
    //reg [31:0] target_pos_x;
    //reg [31:0] target_pos_y;
    //reg [31:0] target_pos_z;
    
    //reg [31:0] curr_pos_x;
    //reg [31:0] curr_pos_y;
    //reg [31:0] curr_pos_z;
    
    //Statemachine values
    localparam INIT     = 0;
    localparam HOMING   = 1;
    localparam LOAD     = 2;
    localparam CALC_0   = 3;
    localparam CALC_1   = 4;
    localparam CALC_2   = 5;
    localparam CALC_3   = 6;
    localparam MOVE     = 7;
    
    //reg [2:0] state;
    //reg [31:0] state_timer;
    //reg [31:0] clk_counter;
    //reg x_reached, y_reached, z_reached, position_reached;
   
    //reg [63:0] next_num_clk_cycles;
    
    //wire [31:0] distance_x, distance_y, distance_z;
    //wire [63:0] squared_distance;
    reg squareroot_start, squareroot_running, result_ready;
    //reg [31:0] distance;
    reg [7:0] target_speed;
    //wire dir_x, dir_y, dir_z;
    wire x_reached, y_reached, z_reached;
    wire [63:0] num_clk_cycles_result;
    wire [63:0] cycles_per_step_x_result;
    wire [63:0] cycles_per_step_y_result;
    wire [63:0] cycles_per_step_z_result;
    
    
    
    assign distance_x = (target_pos_x >= start_pos_x) ? (target_pos_x - start_pos_x) : (start_pos_x - target_pos_x);
    assign distance_y = (target_pos_y >= start_pos_y) ? (target_pos_y - start_pos_y) : (start_pos_y - target_pos_y);
    assign distance_z = (target_pos_z >= start_pos_z) ? (target_pos_z - start_pos_z) : (start_pos_z - target_pos_z);
    assign squared_distance = (distance_x * distance_x) + (distance_y * distance_y) + (distance_z * distance_z);
    
    //calculations happen in the relevant states, otherwise holds 0 to not pointlessly do 64bit mul/div operations
    assign num_clk_cycles_result = (state == CALC_2) ? ((distance * 64'd100000) / ((target_speed >= MIN_SPEED) ? ((target_speed <= MAX_SPEED) ? target_speed : MAX_SPEED) : MIN_SPEED)) : 0;
    assign cycles_per_step_x_result = ((distance_x > 0) && (state == CALC_3)) ? ((next_num_clk_cycles * MICRONS_PER_STEP_X) / distance_x) : 0;
    assign cycles_per_step_y_result = ((distance_y > 0) && (state == CALC_3)) ? ((next_num_clk_cycles * MICRONS_PER_STEP_Y) / distance_y) : 0;
    assign cycles_per_step_z_result = ((distance_z > 0) && (state == CALC_3)) ? ((next_num_clk_cycles * MICRONS_PER_STEP_Z) / distance_z) : 0;
    
    assign x_reached = (curr_pos_x > target_pos_x - MICRONS_PER_STEP_X && curr_pos_x < target_pos_x + MICRONS_PER_STEP_X);
    assign y_reached = (curr_pos_y > target_pos_y - MICRONS_PER_STEP_Y && curr_pos_y < target_pos_y + MICRONS_PER_STEP_Y);
    assign z_reached = (curr_pos_z > target_pos_z - MICRONS_PER_STEP_Z && curr_pos_z < target_pos_z + MICRONS_PER_STEP_Z);
    
    
    
    
    always @(posedge clk) begin
        if(rst || state == INIT) begin
            target_pos_x <= 0;
            target_pos_y <= 0;
            target_pos_z <= 0;
            target_speed <= 0;
            
            motor_dir_x <= 0;
            motor_dir_y <= 0;
            motor_dir_z <= 0;
            
            next_num_clk_cycles <= 0;
            cycles_per_step_x <= 0;
            cycles_per_step_y <= 0;
            cycles_per_step_z <= 0;
            
            
            curr_pos_x <= 0;
            curr_pos_y <= 0;
            curr_pos_z <= 0;
            start_pos_x <= 0;
            start_pos_y <= 0;
            start_pos_z <= 0;
            position_reached <= 0;
            
            squareroot_start <= 0;
            load_next_line <= 0;
            
            clk_counter <= 0;
            state_timer <= 10;
            state <= HOMING;
        end else begin
            squareroot_start <= 0;
            load_next_line <= 0;
            case (state)
                HOMING  : begin
                    if (!enable) begin
                        //MICRONS_PER_STEP_X
                        //1 mm = 1000 microns = [1000/MICRONS_PER_STEP_#] steps
                        //'D' mm/second --> 1/D second/mm = 1 second / [D*1000/MICRONS_PER_STEP_#] steps
                        // --> 100M clk cycles / [D*1000/MICRONS_PER_STEP_#] steps
                        // --> 1 step every [100000/D]*MICRONS_PER_STEP_#
                        cycles_per_step_x <= (manual_move[5]^manual_move[4])*HOMING_CYCLES_PER_STEP_X;
                        cycles_per_step_y <= (manual_move[3]^manual_move[2])*HOMING_CYCLES_PER_STEP_Y;
                        cycles_per_step_z <= (manual_move[1]^manual_move[0])*HOMING_CYCLES_PER_STEP_Z;
                        
                        motor_dir_x <= manual_move[5]^REVERSE_DIR_X;
                        motor_dir_y <= manual_move[3]^REVERSE_DIR_Y;
                        motor_dir_z <= manual_move[1]^REVERSE_DIR_Z;
                    end else begin
                        cycles_per_step_x <= 0;
                        cycles_per_step_y <= 0;
                        cycles_per_step_z <= 0;
                        state <= LOAD; //state_timer and clk_counter weren't changed since INIT
                    end
                end
                
                LOAD    : begin
                    if (enable) begin
                        target_pos_x <= next_pos_x;
                        target_pos_y <= next_pos_y;
                        target_pos_z <= next_pos_z;
                        target_speed <= next_speed;
                        
                        start_pos_x <= curr_pos_x;
                        start_pos_y <= curr_pos_y;
                        start_pos_z <= curr_pos_z;
                        
                        motor_dir_x <= (next_pos_x >= curr_pos_x)^REVERSE_DIR_X;
                        motor_dir_y <= (next_pos_y >= curr_pos_y)^REVERSE_DIR_Y;
                        motor_dir_z <= (next_pos_z >= curr_pos_z)^REVERSE_DIR_Z;
                        
                        load_next_line <= 1; //signal to GCODE Parser that it can load the next line
                        
                        clk_counter <= 0;
                        state_timer <= 256;
                        state <= CALC_0;
                    end else state <= INIT; //previous GCODE was the last, resetting and returning to HOMING mode
                end
                
                CALC_0  : begin //delay to ensure squared_distance comb is stable
                    if (clk_counter < state_timer) begin
                        clk_counter <= clk_counter + 1;
                    end else begin
                        squareroot_start <= 1;
                        clk_counter <= 0;
                        state <= CALC_1;
                    end
                end
                
                CALC_1  : begin
                    if (result_ready) begin
                        clk_counter <= 0;
                        state_timer <= 256;
                        state <= CALC_2;
                    end
                end
                
                CALC_2  : begin
                    if (clk_counter < state_timer) begin
                        //timer to ensure next_num_clk_cycles is stable since 64bit multiplication & division can take multiple cycles
                        clk_counter <= clk_counter + 1;
                    end else begin
                        next_num_clk_cycles <= num_clk_cycles_result;
                        
                        clk_counter <= 0;
                        state_timer <= 256;
                        state <= CALC_3;
                    end
                end
                
                CALC_3  : begin //test timing to ensure next_num_clk_cycles finished division
                    if (clk_counter < state_timer) begin
                        //timer to ensure next_num_clk_cycles is stable since division can take multiple cycles
                        clk_counter <= clk_counter + 1;
                    end else begin
                        //100M*Time / number_of_steps = 100M*Time/(distance[microns]/distance per step[microns])
                        cycles_per_step_x <= cycles_per_step_x_result;
                        cycles_per_step_y <= cycles_per_step_y_result;
                        cycles_per_step_z <= cycles_per_step_z_result;
                        
                        clk_counter <= 0;
                        state_timer <= 10*CYCLES_PER_SECOND; //failsafe timeout if a move fails
                        state <= MOVE;
                    end
                end
                
                MOVE    : begin
                    if (step_feedback_x) curr_pos_x <= curr_pos_x + ((target_pos_x >= start_pos_x) ? MICRONS_PER_STEP_X : -MICRONS_PER_STEP_X);
                    if (step_feedback_y) curr_pos_y <= curr_pos_y + ((target_pos_y >= start_pos_y) ? MICRONS_PER_STEP_Y : -MICRONS_PER_STEP_Y);
                    if (step_feedback_z) curr_pos_z <= curr_pos_z + ((target_pos_z >= start_pos_z) ? MICRONS_PER_STEP_Z : -MICRONS_PER_STEP_Z);
                    
                    if (x_reached) cycles_per_step_x <= 0;
                    if (y_reached) cycles_per_step_y <= 0;
                    if (z_reached) cycles_per_step_z <= 0;
                    
                    if (clk_counter >= state_timer || (x_reached && y_reached && z_reached)) begin
                        clk_counter <= 0;
                        state_timer <= 10;
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
        if (rst) begin
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
                if (i == 0 && bit > val) begin
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
            end else if (state == CALC_2) begin
                result_ready <= 0;
            end
        end
    end
    



endmodule
