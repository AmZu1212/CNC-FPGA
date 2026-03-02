//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Amir Zuabi & Alex Vassiliev
// 
// Create Date: 06/23/2025 12:48:40 AM
// Design Name: 
// Module Name: GCODE_Parser
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


module GCODE_Parser(
    //Inputs
    input clk,
    input rst,
    input start,
    input load_next_line,
    
    //Outputs
    output reg [7:0] next_speed,
    output reg signed [31:0] next_pos_x,
    output reg signed [31:0] next_pos_y,
    output reg signed [31:0] next_pos_z,
    output reg enable,
    output reg [15:0] curr_line,
    output reg [2:0] state,
    output reg unsigned [31:0] detected_count
    );
    
    localparam max_line = 2256;//912;
    //reg [15:0] curr_line;
    reg [15:0] speed [0:max_line-1]; //[0:911]
    reg signed [20:0] pos_x [0:max_line-1];
    reg signed [20:0] pos_y [0:max_line-1];
    reg signed [20:0] pos_z [0:max_line-1];
    
    
    reg [31:0] risingedge_buffer;
    
    reg start_prev;
    wire start_risingedge;
    assign start_risingedge = start && !start_prev;
    
    //reg [2:0] state;
    localparam IDLE     = 0;
    localparam RUNNING  = 1;
    localparam RETURN   = 2;
    
    reg [1:0] return_state;
    localparam XY_CHECK     = 0;
    localparam Z_RAISE      = 1;
    localparam XY_HOME      = 2;
    localparam Z_LOWER      = 3;
    
    localparam Z_SAFE_HEIGHT    = 5000; //microns
    localparam RETURN_SPEED_Z   = 20;   //mm/s
    localparam RETURN_SPEED_XY  = 60;
    
    
    always @(posedge clk) begin
        if (rst) begin
            enable <= 0;
            curr_line <= 0;
            start_prev <= 0;
            state <= IDLE;
            return_state <= XY_CHECK;
            
            next_speed <= speed[0];
            next_pos_x <= pos_x[0];
            next_pos_y <= pos_y[0];
            next_pos_z <= pos_z[0];
            
            detected_count <= 0;
            risingedge_buffer <= 100000000;
        end else begin
            start_prev <= start;
            enable <= 0;
            
            if (start_risingedge) begin
                if (!risingedge_buffer) detected_count <= detected_count + 1;
                risingedge_buffer <= 100000000;
            end else if (risingedge_buffer > 0) risingedge_buffer <= risingedge_buffer - 1;
            
            case (state)
                IDLE    : begin
                    if (start_risingedge && !risingedge_buffer) state <= RUNNING;
                end
                
                RUNNING : begin
                    enable <= 1;
                    if (start_risingedge && !risingedge_buffer) begin
                        if (curr_line > 0) curr_line <= curr_line - 1;
                        state <= RETURN;
                    end else begin
                        if (load_next_line) curr_line <= curr_line + 1;
                        if (curr_line < max_line) begin
                            next_speed <= speed[curr_line];
                            next_pos_x <= pos_x[curr_line];
                            next_pos_y <= pos_y[curr_line];
                            next_pos_z <= pos_z[curr_line];
                        end else begin
                            if (pos_x[max_line - 1] || pos_y[max_line - 1] || pos_z[max_line - 1]) begin
                                curr_line <= max_line - 1;
                                state <= RETURN;
                            end else begin
                                curr_line <= 0;
                                state <= IDLE;
                            end
                        end
                    end
                end
                
                RETURN  : begin
                    enable <= 1;
                    case (return_state)
                        
                        XY_CHECK : begin
                            if (pos_x[curr_line] || pos_y[curr_line]) begin
                                if (pos_z[curr_line] < Z_SAFE_HEIGHT) begin
                                    return_state <= Z_RAISE;
                                end else begin
                                    return_state <= XY_HOME;
                                end
                            end else begin
                                return_state <= Z_LOWER;
                            end
                        end
                        
                        Z_RAISE : begin
                            //curr_line was decremented to match the currently running line
                            //so this keeps same X/Y but raises Z
                            next_pos_x <= pos_x[curr_line];
                            next_pos_y <= pos_y[curr_line];
                            next_pos_z <= Z_SAFE_HEIGHT;
                            next_speed <= RETURN_SPEED_Z;
                            if (load_next_line) return_state <= XY_HOME;
                        end
                        
                        XY_HOME : begin
                            next_pos_x <= 0;
                            next_pos_y <= 0;
                            next_speed <= RETURN_SPEED_XY;
                            if (load_next_line) return_state <= Z_LOWER;
                        end
                        
                        Z_LOWER : begin
                            next_pos_z <= 0;
                            next_speed <= RETURN_SPEED_Z;
                            if (load_next_line) begin
                                curr_line <= 0;
                                state <= IDLE;
                                return_state <= XY_CHECK;
                            end
                        end
                        
                    endcase
                end
                
            endcase
        end
    end
    
    initial begin
    //X Y Z F
    //Note F speed is in mm/sec, max tested speed = 90
    
    $readmemh("pos_x.hex", pos_x);
    $readmemh("pos_y.hex", pos_y);
    $readmemh("pos_z.hex", pos_z);
    $readmemh("speed.hex", speed);
    
//    pos_x[000] = 000000; pos_y[000] = 000000; pos_z[000] = 05000; speed[000] = 40;
//    pos_x[001] = 050000; pos_y[001] = 000000; pos_z[001] = 05000; speed[001] = 40;
//    pos_x[002] = 050000; pos_y[002] = 000000; pos_z[002] = 00000; speed[002] = 40;
//    pos_x[003] = 062941; pos_y[003] = 001704; pos_z[003] = 00000; speed[003] = 90;
//    pos_x[004] = 075000; pos_y[004] = 006699; pos_z[004] = 00000; speed[004] = 90;
//    pos_x[005] = 085355; pos_y[005] = 014645; pos_z[005] = 00000; speed[005] = 90;
//    pos_x[006] = 093301; pos_y[006] = 025000; pos_z[006] = 00000; speed[006] = 90;
//    pos_x[007] = 098296; pos_y[007] = 037059; pos_z[007] = 00000; speed[007] = 90;
//    pos_x[008] = 100000; pos_y[008] = 050000; pos_z[008] = 00000; speed[008] = 90;
//    pos_x[009] = 098296; pos_y[009] = 062941; pos_z[009] = 00000; speed[009] = 90;
//    pos_x[010] = 093301; pos_y[010] = 075000; pos_z[010] = 00000; speed[010] = 90;
//    pos_x[011] = 085355; pos_y[011] = 085355; pos_z[011] = 00000; speed[011] = 90;
//    pos_x[012] = 075000; pos_y[012] = 093301; pos_z[012] = 00000; speed[012] = 90;
//    pos_x[013] = 062941; pos_y[013] = 098296; pos_z[013] = 00000; speed[013] = 90;
//    pos_x[014] = 050000; pos_y[014] = 100000; pos_z[014] = 00000; speed[014] = 90;
//    pos_x[015] = 037059; pos_y[015] = 098296; pos_z[015] = 00000; speed[015] = 90;
//    pos_x[016] = 025000; pos_y[016] = 093301; pos_z[016] = 00000; speed[016] = 90;
//    pos_x[017] = 014645; pos_y[017] = 085355; pos_z[017] = 00000; speed[017] = 90;
//    pos_x[018] = 006699; pos_y[018] = 075000; pos_z[018] = 00000; speed[018] = 90;
//    pos_x[019] = 001704; pos_y[019] = 062941; pos_z[019] = 00000; speed[019] = 90;
//    pos_x[020] = 000000; pos_y[020] = 050000; pos_z[020] = 00000; speed[020] = 90;
//    pos_x[021] = 001704; pos_y[021] = 037059; pos_z[021] = 00000; speed[021] = 90;
//    pos_x[022] = 006699; pos_y[022] = 025000; pos_z[022] = 00000; speed[022] = 90;
//    pos_x[023] = 014645; pos_y[023] = 014645; pos_z[023] = 00000; speed[023] = 90;
//    pos_x[024] = 025000; pos_y[024] = 006699; pos_z[024] = 00000; speed[024] = 90;
//    pos_x[025] = 037059; pos_y[025] = 001704; pos_z[025] = 00000; speed[025] = 90;
//    pos_x[026] = 050000; pos_y[026] = 000000; pos_z[026] = 00000; speed[026] = 90;
//    pos_x[027] = 050000; pos_y[027] = 000000; pos_z[027] = 05000; speed[027] = 40;
//    pos_x[028] = 000000; pos_y[028] = 000000; pos_z[028] = 05000; speed[028] = 40;
//    pos_x[029] = 000000; pos_y[029] = 000000; pos_z[029] = 00000; speed[029] = 40;
    
    end
endmodule
