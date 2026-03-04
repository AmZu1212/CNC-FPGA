`timescale 1ns/1ps

module GcodeFetcher_tb;
    localparam MAX_LINE = 905;

    reg clk;
    reg rst;
    reg rewind;
    reg cmd_ready;

    wire cmd_valid;
    wire cmd_last;
    wire [7:0] cmd_speed;
    wire signed [31:0] cmd_pos_x;
    wire signed [31:0] cmd_pos_y;
    wire signed [31:0] cmd_pos_z;

    integer errors;
    integer idx;

    reg [15:0] ref_speed [0:MAX_LINE-1];
    reg signed [20:0] ref_pos_x [0:MAX_LINE-1];
    reg signed [20:0] ref_pos_y [0:MAX_LINE-1];
    reg signed [20:0] ref_pos_z [0:MAX_LINE-1];

    GcodeFetcher dut (
        .clk(clk),
        .rst(rst),
        .rewind(rewind),
        .cmd_ready(cmd_ready),
        .cmd_valid(cmd_valid),
        .cmd_last(cmd_last),
        .cmd_speed(cmd_speed),
        .cmd_pos_x(cmd_pos_x),
        .cmd_pos_y(cmd_pos_y),
        .cmd_pos_z(cmd_pos_z)
    );

    always #5 clk = ~clk;

    task expect_outputs;
        input [7:0] exp_speed;
        input signed [31:0] exp_x;
        input signed [31:0] exp_y;
        input signed [31:0] exp_z;
        input exp_valid;
        input exp_last;
        begin
            if (cmd_speed !== exp_speed ||
                cmd_pos_x !== exp_x ||
                cmd_pos_y !== exp_y ||
                cmd_pos_z !== exp_z ||
                cmd_valid !== exp_valid ||
                cmd_last !== exp_last) begin
                $display(
                    "FAIL: expected speed=%0d x=%0d y=%0d z=%0d valid=%0b last=%0b got speed=%0d x=%0d y=%0d z=%0d valid=%0b last=%0b",
                    exp_speed, exp_x, exp_y, exp_z, exp_valid, exp_last,
                    cmd_speed, cmd_pos_x, cmd_pos_y, cmd_pos_z, cmd_valid, cmd_last
                );
                errors = errors + 1;
            end
        end
    endtask

    task accept_command;
        begin
            @(posedge clk);
            cmd_ready <= 1'b1;
            @(posedge clk);
            cmd_ready <= 1'b0;
        end
    endtask

    task expect_done;
        begin
            if (cmd_valid !== 1'b0 || cmd_last !== 1'b0) begin
                $display(
                    "FAIL: expected feeder done, got valid=%0b last=%0b speed=%0d x=%0d y=%0d z=%0d",
                    cmd_valid, cmd_last, cmd_speed, cmd_pos_x, cmd_pos_y, cmd_pos_z
                );
                errors = errors + 1;
            end
        end
    endtask

    initial begin
        $dumpfile("outputs/GcodeFetcher_tb.vcd");
        $dumpvars(0, GcodeFetcher_tb);

        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/speed.hex", ref_speed);
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/pos_x.hex", ref_pos_x);
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/pos_y.hex", ref_pos_y);
        $readmemh("E:/Git-Repos/CNC-FPGA/Hexfiles/kirby/pos_z.hex", ref_pos_z);

        clk = 1'b0;
        rst = 1'b1;
        rewind = 1'b0;
        cmd_ready = 1'b0;
        errors = 0;

        repeat (2) @(posedge clk);
        rst = 1'b0;
        @(posedge clk);

        repeat (3) @(posedge clk);
        expect_outputs(
            ref_speed[0][7:0],
            ref_pos_x[0],
            ref_pos_y[0],
            ref_pos_z[0],
            1'b1,
            1'b0
        );

        for (idx = 0; idx < MAX_LINE; idx = idx + 1) begin
            expect_outputs(
                ref_speed[idx][7:0],
                ref_pos_x[idx],
                ref_pos_y[idx],
                ref_pos_z[idx],
                1'b1,
                (idx == MAX_LINE - 1)
            );

            accept_command();
            @(posedge clk);

            if (idx < MAX_LINE - 1) begin
                expect_outputs(
                    ref_speed[idx + 1][7:0],
                    ref_pos_x[idx + 1],
                    ref_pos_y[idx + 1],
                    ref_pos_z[idx + 1],
                    1'b1,
                    (idx + 1 == MAX_LINE - 1)
                );
            end
        end

        expect_done();

        @(posedge clk);
        rewind <= 1'b1;
        @(posedge clk);
        rewind <= 1'b0;
        @(posedge clk);
        expect_outputs(
            ref_speed[0][7:0],
            ref_pos_x[0],
            ref_pos_y[0],
            ref_pos_z[0],
            1'b1,
            1'b0
        );

        if (errors == 0) begin
            $display("ALL TESTS PASSED");
        end else begin
            $display("TESTS FAILED: %0d errors", errors);
        end

        $finish;
    end
endmodule
