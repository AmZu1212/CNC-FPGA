module GcodeFetcher(
    input clk,
    input rst,
    input rewind,
    input cmd_ready,

    input signed [31:0] x,
    input signed [31:0] y,
    input signed [31:0] z,
    input [7:0] speed,
    input [3:0] interconnect_in,

    output reg [3:0] interconnect_out,
    output reg cmd_valid,
    output reg cmd_last,
    output reg [7:0] cmd_speed,
    output reg signed [31:0] cmd_pos_x,
    output reg signed [31:0] cmd_pos_y,
    output reg signed [31:0] cmd_pos_z
    );

    localparam IN_LINE_READY_MASK = 8'h01;
    localparam IN_LAST_LINE_MASK  = 8'h02;
    localparam IN_ERROR_MASK      = 8'h04;

    localparam OUT_START_REQ_MASK = 8'h01;
    localparam OUT_NEXT_REQ_MASK  = 8'h02;

    localparam ST_IDLE            = 2'd0;
    localparam ST_WAIT_READY_LOW  = 2'd1;
    localparam ST_WAIT_READY_RISE = 2'd2;
    localparam ST_HAVE_CMD        = 2'd3;

    reg [1:0] state;
    reg requesting_start;
    reg line_ready_prev;

    wire line_ready_now;
    wire line_last_now;
    wire line_error_now;
    wire line_ready_rise;
    wire cmd_transfer;

    assign line_ready_now = (interconnect_in & IN_LINE_READY_MASK) != 0;
    assign line_last_now = (interconnect_in & IN_LAST_LINE_MASK) != 0;
    assign line_error_now = (interconnect_in & IN_ERROR_MASK) != 0;
    assign line_ready_rise = line_ready_now && !line_ready_prev;
    assign cmd_transfer = cmd_valid && cmd_ready;

    always @(posedge clk) begin
        if (rst) begin
            interconnect_out <= 0;
            cmd_valid <= 0;
            cmd_last <= 0;
            cmd_speed <= 0;
            cmd_pos_x <= 0;
            cmd_pos_y <= 0;
            cmd_pos_z <= 0;
            state <= ST_IDLE;
            requesting_start <= 0;
            line_ready_prev <= 0;
        end else begin
            line_ready_prev <= line_ready_now;

            if (rewind) begin
                cmd_valid <= 0;
                cmd_last <= 0;
                interconnect_out <= OUT_START_REQ_MASK;
                requesting_start <= 1;

                if (line_ready_now) begin
                    state <= ST_WAIT_READY_LOW;
                end else begin
                    state <= ST_WAIT_READY_RISE;
                end
            end else if (line_error_now) begin
                cmd_valid <= 0;
                cmd_last <= 0;
                interconnect_out <= 0;
                requesting_start <= 0;
                state <= ST_IDLE;
            end else begin
                case (state)
                    ST_IDLE : begin
                        interconnect_out <= 0;
                        cmd_valid <= 0;
                        cmd_last <= 0;
                    end

                    ST_WAIT_READY_LOW : begin
                        interconnect_out <= requesting_start ? OUT_START_REQ_MASK : OUT_NEXT_REQ_MASK;
                        if (!line_ready_now) begin
                            state <= ST_WAIT_READY_RISE;
                        end
                    end

                    ST_WAIT_READY_RISE : begin
                        interconnect_out <= requesting_start ? OUT_START_REQ_MASK : OUT_NEXT_REQ_MASK;
                        if (line_ready_rise) begin
                            cmd_pos_x <= x;
                            cmd_pos_y <= y;
                            cmd_pos_z <= z;
                            cmd_speed <= speed;
                            cmd_last <= line_last_now;
                            cmd_valid <= 1;
                            interconnect_out <= 0;
                            requesting_start <= 0;
                            state <= ST_HAVE_CMD;
                        end
                    end

                    ST_HAVE_CMD : begin
                        interconnect_out <= 0;
                        if (cmd_transfer) begin
                            if (cmd_last) begin
                                cmd_valid <= 0;
                                cmd_last <= 0;
                                state <= ST_IDLE;
                            end else begin
                                cmd_valid <= 0;
                                cmd_last <= 0;
                                interconnect_out <= OUT_NEXT_REQ_MASK;
                                requesting_start <= 0;

                                if (line_ready_now) begin
                                    state <= ST_WAIT_READY_LOW;
                                end else begin
                                    state <= ST_WAIT_READY_RISE;
                                end
                            end
                        end
                    end
                endcase
            end
        end
    end
endmodule
