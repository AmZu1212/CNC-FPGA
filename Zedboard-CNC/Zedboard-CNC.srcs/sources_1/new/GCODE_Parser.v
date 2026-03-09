module GCODE_Parser(
    //Inputs
    input clk,
    input rst,
    input start,
    input load_next_line,
    // The feeder drives the next command on these inputs.
    input [7:0] next_line_speed,
    input signed [31:0] next_x,
    input signed [31:0] next_y,
    input signed [31:0] next_z,
    input last_line,
    input [1:0] ack_phase,
    input mount_ok,
    input mount_fail,

    //Outputs
    // The coordinator consumes the current command from these outputs.
    output reg [7:0] speed,
    output reg signed [31:0] x,
    output reg signed [31:0] y,
    output reg signed [31:0] z,
    output reg enable,
    // Pulse to the feeder when the coordinator has consumed the current line.
    output request_next_line,
    output reg [1:0] phase,
    output reg start_program,
    output reg mount_req
    );

    // Keep a stable copy of the previously accepted command so cancel/return
    // logic does not depend on the feeder holding old data.
    reg [7:0] prev_speed;
    reg signed [31:0] prev_pos_x;
    reg signed [31:0] prev_pos_y;
    reg signed [31:0] prev_pos_z;
    reg current_line_last;
    reg request_pending;

    reg [31:0] risingedge_buffer;

    reg start_prev;
    wire start_risingedge;
    assign start_risingedge = start && !start_prev;

    reg [2:0] state;
    localparam IDLE     = 0;
    localparam WAIT_MOUNT = 1;
    localparam RUNNING  = 2;
    localparam RETURN   = 3;

    reg [1:0] return_state;
    localparam XY_CHECK     = 0;
    localparam Z_RAISE      = 1;
    localparam XY_HOME      = 2;
    localparam Z_LOWER      = 3;

    localparam Z_SAFE_HEIGHT    = 5000; //microns
    localparam RETURN_SPEED_Z   = 20;   //mm/s
    localparam RETURN_SPEED_XY  = 60;

    // Hold the request high until the feeder acknowledges the matching phase.
    assign request_next_line = request_pending;


    always @(posedge clk) begin
        if (rst) begin
            enable <= 0;
            start_prev <= 0;
            state <= IDLE;
            return_state <= XY_CHECK;
            phase <= 2'b00;
            start_program <= 0;
            mount_req <= 0;

            speed <= next_line_speed;
            x <= next_x;
            y <= next_y;
            z <= next_z;

            prev_speed <= 0;
            prev_pos_x <= 0;
            prev_pos_y <= 0;
            prev_pos_z <= 0;
            current_line_last <= 0;
            request_pending <= 0;

            risingedge_buffer <= 100000000;
        end else begin
            start_prev <= start;
            enable <= 0;
            start_program <= 0;

            if (start_risingedge) begin
                risingedge_buffer <= 100000000;
            end else if (risingedge_buffer > 0) risingedge_buffer <= risingedge_buffer - 1;

            case (state)
                IDLE    : begin
                    if (start_risingedge && !risingedge_buffer) begin
                        state <= WAIT_MOUNT;
                        phase <= 2'b00;
                        prev_speed <= 0;
                        prev_pos_x <= 0;
                        prev_pos_y <= 0;
                        prev_pos_z <= 0;
                        current_line_last <= 0;
                        request_pending <= 0;
                        mount_req <= 1;
                    end
                end

                WAIT_MOUNT : begin
                    if (mount_fail) begin
                        state <= IDLE;
                        phase <= 2'b00;
                        mount_req <= 0;
                    end else if (mount_ok) begin
                        state <= RUNNING;
                        phase <= 2'b00;
                        request_pending <= 0;
                        current_line_last <= last_line;
                        speed <= next_line_speed;
                        x <= next_x;
                        y <= next_y;
                        z <= next_z;
                        start_program <= 1;
                    end
                end

                RUNNING : begin
                    enable <= 1;
                    if (request_pending && (ack_phase == phase) && (phase != 2'b00)) begin
                        request_pending <= 0;
                        current_line_last <= last_line;
                        speed <= next_line_speed;
                        x <= next_x;
                        y <= next_y;
                        z <= next_z;
                    end
                    // A second press cancels the run and enters the return path.
                    if (start_risingedge && !risingedge_buffer) begin
                        state <= RETURN;
                        request_pending <= 0;
                        mount_req <= 0;
                    end else begin
                        if (load_next_line) begin
                            // Save the command that was just accepted so return mode
                            // can still reference it after the feeder advances.
                            prev_speed <= speed;
                            prev_pos_x <= x;
                            prev_pos_y <= y;
                            prev_pos_z <= z;
                            if (current_line_last) begin
                                state <= RETURN;
                                request_pending <= 0;
                                mount_req <= 0;
                            end else begin
                                phase <= (phase == 2'b01) ? 2'b10 : 2'b01;
                                request_pending <= 1;
                            end
                        end
                    end
                end

                RETURN  : begin
                    enable <= 1;
                    case (return_state)

                        XY_CHECK : begin
                            if (prev_pos_x || prev_pos_y) begin
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
                            // Keep XY fixed and raise Z to a safe height first.
                            x <= prev_pos_x;
                            y <= prev_pos_y;
                            z <= Z_SAFE_HEIGHT;
                            speed <= RETURN_SPEED_Z;
                            if (load_next_line) return_state <= XY_HOME;
                        end

                        XY_HOME : begin
                            x <= 0;
                            y <= 0;
                            speed <= RETURN_SPEED_XY;
                            if (load_next_line) return_state <= Z_LOWER;
                        end

                        Z_LOWER : begin
                            z <= 0;
                            speed <= RETURN_SPEED_Z;
                            if (load_next_line) begin
                                state <= IDLE;
                                return_state <= XY_CHECK;
                                phase <= 2'b00;
                                request_pending <= 0;
                                current_line_last <= 0;
                                mount_req <= 0;
                            end
                        end

                    endcase
                end

            endcase
        end
    end

endmodule
