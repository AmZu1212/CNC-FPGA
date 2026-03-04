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
    output reg enable
    );

    localparam max_line = 905;//912; // *** refactor
    reg [15:0] curr_line;
    reg [15:0] speed [0:max_line-1]; //[0:911] // remove 2d array + add support for previous.
    reg signed [20:0] pos_x [0:max_line-1];
    reg signed [20:0] pos_y [0:max_line-1];
    reg signed [20:0] pos_z [0:max_line-1];


    reg [31:0] risingedge_buffer;

    reg start_prev;
    wire start_risingedge;
    assign start_risingedge = start && !start_prev;

    reg [2:0] state;
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

            risingedge_buffer <= 100000000;
        end else begin
            start_prev <= start;
            enable <= 0;

            if (start_risingedge) begin
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
    end
endmodule
