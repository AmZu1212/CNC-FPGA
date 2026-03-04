module GcodeFetcher(
    input clk,
    input rst,
    input rewind,
    input cmd_ready,

    output reg cmd_valid,
    output reg cmd_last,
    output reg [7:0] cmd_speed,
    output reg signed [31:0] cmd_pos_x,
    output reg signed [31:0] cmd_pos_y,
    output reg signed [31:0] cmd_pos_z
    );

    localparam MAX_LINE = 905;

    reg [15:0] curr_line;
    reg [15:0] speed [0:MAX_LINE-1];
    reg signed [20:0] pos_x [0:MAX_LINE-1];
    reg signed [20:0] pos_y [0:MAX_LINE-1];
    reg signed [20:0] pos_z [0:MAX_LINE-1];

    wire cmd_transfer;
    wire current_is_last;

    assign cmd_transfer = cmd_valid && cmd_ready;
    assign current_is_last = (curr_line == (MAX_LINE - 1));

    always @(posedge clk) begin
        if (rst || rewind) begin
            curr_line <= 0;
            cmd_valid <= 1;
            cmd_last <= (MAX_LINE == 1);
            cmd_speed <= speed[0];
            cmd_pos_x <= pos_x[0];
            cmd_pos_y <= pos_y[0];
            cmd_pos_z <= pos_z[0];
        end else begin
            if (cmd_transfer) begin
                if (current_is_last) begin
                    cmd_valid <= 0;
                    cmd_last <= 0;
                end else begin
                    curr_line <= curr_line + 1;
                    cmd_valid <= 1;
                    cmd_last <= (curr_line + 1 == (MAX_LINE - 1));
                    cmd_speed <= speed[curr_line + 1];
                    cmd_pos_x <= pos_x[curr_line + 1];
                    cmd_pos_y <= pos_y[curr_line + 1];
                    cmd_pos_z <= pos_z[curr_line + 1];
                end
            end
        end
    end

    initial begin
        // X Y Z F
        // Note F speed is in mm/sec, max tested speed = 90
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/pos_x.hex", pos_x);
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/pos_y.hex", pos_y);
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/pos_z.hex", pos_z);
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/speed.hex", speed);
    end
endmodule
