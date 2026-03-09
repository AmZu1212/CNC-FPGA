module hexfile_holder(
    input clk,
    input rst,
    input mount_req,
    input request_next_line,
    input [1:0] phase,

    output reg [7:0] next_line_speed,
    output reg signed [31:0] next_x,
    output reg signed [31:0] next_y,
    output reg signed [31:0] next_z,
    output reg [1:0] ack_phase,
    output reg mount_ok,
    output reg mount_fail
    );

    localparam MAX_LINE = 905;

    reg [15:0] line_index;
    reg mount_req_prev;
    reg session_active;
    reg [1:0] last_phase;
    reg fail_once;

    reg [15:0] speed_mem [0:MAX_LINE-1];
    reg signed [31:0] x_mem [0:MAX_LINE-1];
    reg signed [31:0] y_mem [0:MAX_LINE-1];
    reg signed [31:0] z_mem [0:MAX_LINE-1];

    wire mount_req_rise;
    wire valid_phase;
    wire phase_advanced;

    assign mount_req_rise = mount_req && !mount_req_prev;
    assign valid_phase = (phase == 2'b01) || (phase == 2'b10);
    assign phase_advanced = valid_phase && (phase != last_phase);

    task load_line;
        input [15:0] idx;
        begin
            next_line_speed <= speed_mem[idx][7:0];
            next_x <= x_mem[idx];
            next_y <= y_mem[idx];
            next_z <= z_mem[idx];
        end
    endtask

    initial begin
        $readmemh("speed.hex", speed_mem);
        $readmemh("pos_x.hex", x_mem);
        $readmemh("pos_y.hex", y_mem);
        $readmemh("pos_z.hex", z_mem);
    end

    always @(posedge clk) begin
        if (rst) begin
            line_index <= 0;
            mount_req_prev <= 0;
            session_active <= 0;
            last_phase <= 2'b00;
            ack_phase <= 2'b00;
            mount_ok <= 0;
            mount_fail <= 0;
            fail_once <= 0;
            next_line_speed <= 0;
            next_x <= 0;
            next_y <= 0;
            next_z <= 0;
        end else begin
            mount_req_prev <= mount_req;

            if (!mount_req) begin
                session_active <= 0;
                last_phase <= 2'b00;
                ack_phase <= 2'b00;
                mount_ok <= 0;
                mount_fail <= 0;
            end else if (mount_req_rise) begin
                line_index <= 0;
                last_phase <= 2'b00;
                ack_phase <= 2'b00;
                if (!fail_once) begin // set to fail once to test mount_fail functionality.
                    session_active <= 0;
                    mount_ok <= 0;
                    mount_fail <= 1;
                    fail_once <= 1;
                end else begin
                    session_active <= 1;
                    mount_ok <= 1;
                    mount_fail <= 0;
                    load_line(0);
                end
            end else if (session_active && request_next_line && phase_advanced) begin
                last_phase <= phase;
                if (line_index < (MAX_LINE - 1)) begin
                    line_index <= line_index + 1;
                    load_line(line_index + 1);
                    ack_phase <= phase;
                end else begin
                    session_active <= 0;
                    ack_phase <= phase;
                end
            end
        end
    end
endmodule
