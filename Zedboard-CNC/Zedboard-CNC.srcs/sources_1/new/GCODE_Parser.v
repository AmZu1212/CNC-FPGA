module GCODE_Parser(
    // Inputs
    input clk,
    input rst,
    input start,
    input load_next_line,
    input cmd_valid,
    input cmd_last,
    input [7:0] cmd_speed,
    input signed [31:0] cmd_pos_x,
    input signed [31:0] cmd_pos_y,
    input signed [31:0] cmd_pos_z,

    // Outputs
    output cmd_ready,
    output reg rewind,
    output reg [7:0] next_speed,
    output reg signed [31:0] next_pos_x,
    output reg signed [31:0] next_pos_y,
    output reg signed [31:0] next_pos_z,
    output reg enable
    );

    reg [31:0] risingedge_buffer;

    reg start_prev;
    wire start_risingedge;
    wire feeder_transfer;

    reg [1:0] state;
    localparam IDLE    = 0;
    localparam RUNNING = 1;
    localparam RETURN  = 2;

    reg [1:0] return_state;
    localparam XY_CHECK = 0;
    localparam Z_RAISE  = 1;
    localparam XY_HOME  = 2;
    localparam Z_LOWER  = 3;

    reg next_valid;
    reg next_last;
    reg prev_valid;
    reg signed [31:0] prev_pos_x;
    reg signed [31:0] prev_pos_y;
    reg signed [31:0] prev_pos_z;

    localparam Z_SAFE_HEIGHT   = 5000; // microns
    localparam RETURN_SPEED_Z  = 20;   // mm/s
    localparam RETURN_SPEED_XY = 60;

    assign start_risingedge = start && !start_prev;
    assign cmd_ready = (state == RUNNING) && !next_valid;
    assign feeder_transfer = cmd_valid && cmd_ready;

    always @(posedge clk) begin
        if (rst) begin
            enable <= 0;
            rewind <= 0;
            start_prev <= 0;
            state <= IDLE;
            return_state <= XY_CHECK;

            next_speed <= 0;
            next_pos_x <= 0;
            next_pos_y <= 0;
            next_pos_z <= 0;
            next_valid <= 0;
            next_last <= 0;

            prev_valid <= 0;
            prev_pos_x <= 0;
            prev_pos_y <= 0;
            prev_pos_z <= 0;

            risingedge_buffer <= 100000000;
        end else begin
            start_prev <= start;
            enable <= 0;
            rewind <= 0;

            if (start_risingedge) begin
                risingedge_buffer <= 100000000;
            end else if (risingedge_buffer > 0) begin
                risingedge_buffer <= risingedge_buffer - 1;
            end

            if (feeder_transfer) begin
                next_speed <= cmd_speed;
                next_pos_x <= cmd_pos_x;
                next_pos_y <= cmd_pos_y;
                next_pos_z <= cmd_pos_z;
                next_valid <= 1;
                next_last <= cmd_last;
            end

            case (state)
                IDLE : begin
                    if (start_risingedge && !risingedge_buffer) begin
                        rewind <= 1;
                        state <= RUNNING;
                        return_state <= XY_CHECK;
                        next_valid <= 0;
                        next_last <= 0;
                        prev_valid <= 0;
                    end
                end

                RUNNING : begin
                    enable <= next_valid;

                    if (start_risingedge && !risingedge_buffer) begin
                        next_valid <= 0;
                        next_last <= 0;
                        state <= RETURN;
                        return_state <= XY_CHECK;
                    end else if (load_next_line && next_valid) begin
                        prev_valid <= 1;
                        prev_pos_x <= next_pos_x;
                        prev_pos_y <= next_pos_y;
                        prev_pos_z <= next_pos_z;
                        next_valid <= 0;

                        if (next_last) begin
                            if (next_pos_x || next_pos_y || next_pos_z) begin
                                state <= RETURN;
                                return_state <= XY_CHECK;
                            end else begin
                                state <= IDLE;
                            end
                        end
                    end
                end

                RETURN : begin
                    enable <= 1;

                    case (return_state)
                        XY_CHECK : begin
                            if (prev_valid && (prev_pos_x || prev_pos_y)) begin
                                if (prev_pos_z < Z_SAFE_HEIGHT) begin
                                    return_state <= Z_RAISE;
                                end else begin
                                    return_state <= XY_HOME;
                                end
                            end else begin
                                return_state <= Z_LOWER;
                            end
                        end

                        Z_RAISE : begin
                            next_pos_x <= prev_pos_x;
                            next_pos_y <= prev_pos_y;
                            next_pos_z <= Z_SAFE_HEIGHT;
                            next_speed <= RETURN_SPEED_Z;
                            if (load_next_line) begin
                                return_state <= XY_HOME;
                            end
                        end

                        XY_HOME : begin
                            next_pos_x <= 0;
                            next_pos_y <= 0;
                            next_speed <= RETURN_SPEED_XY;
                            if (load_next_line) begin
                                return_state <= Z_LOWER;
                            end
                        end

                        Z_LOWER : begin
                            next_pos_z <= 0;
                            next_speed <= RETURN_SPEED_Z;
                            if (load_next_line) begin
                                state <= IDLE;
                                return_state <= XY_CHECK;
                                next_valid <= 0;
                                next_last <= 0;
                                prev_valid <= 0;
                            end
                        end
                    endcase
                end
            endcase
        end
    end
endmodule
