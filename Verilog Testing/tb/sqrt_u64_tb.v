`timescale 1ns/1ps
`define START_TIMEOUT_CYCLES 50
`define DONE_TIMEOUT_CYCLES  250

module sqrt_u64_tb;
    reg         clk;
    reg         rst;
    reg         start;
    reg  [63:0] in_value;
    wire [63:0] root;
    wire        done;
    wire        busy;

    integer     errors;

    sqrt_u64 dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .in_value(in_value),
        .root(root),
        .done(done),
        .busy(busy)
    );

    always #5 clk = ~clk; // period = 10ns => 100MHz

    function [63:0] ref_sqrt64;
        input [63:0] x;
        reg   [63:0] cand;
        reg   [63:0] ans;
        reg  [127:0] sq;
        integer k;
        begin
            ans = 64'd0;
            for (k = 31; k >= 0; k = k - 1) begin
                cand = ans | (64'd1 << k);
                sq   = cand * cand;
                if (sq <= x) begin
                    ans = cand;
                end
            end
            ref_sqrt64 = ans;
        end
    endfunction

    task run_case;
        input [63:0] value;
        reg   [63:0] exp;
        integer timeout;
        begin
            exp = ref_sqrt64(value);

            @(posedge clk);
            in_value <= value;
            start    <= 1'b1;
            @(posedge clk);
            start    <= 1'b0;

            timeout = 0;
            while (!busy && timeout < `START_TIMEOUT_CYCLES) begin
                @(posedge clk);
                timeout = timeout + 1;
            end

            timeout = 0;
            while ((busy || !done) && timeout < `DONE_TIMEOUT_CYCLES) begin
                @(posedge clk);
                timeout = timeout + 1;
            end

            if (busy || !done) begin
                $display("TIMEOUT: value=%0d", value);
                errors = errors + 1;
            end else if (root !== exp) begin
                $display("FAIL: value=%0d expected=%0d got=%0d", value, exp, root);
                errors = errors + 1;
            end else begin
                $display("PASS: value=%0d root=%0d cycles=%0d", value, root, timeout);
            end

            @(posedge clk);
        end
    endtask

    integer n;
    reg [63:0] rnd;

    initial begin
        $dumpfile("outputs/sqrt_u64_tb.vcd");
        $dumpvars(0, sqrt_u64_tb);

        clk      = 1'b0;
        rst      = 1'b1;
        start    = 1'b0;
        in_value = 64'd0;
        errors   = 0;

        repeat (3) @(posedge clk);
        rst = 1'b0;

        run_case(64'd0);
        run_case(64'd1);
        run_case(64'd2);
        run_case(64'd3);
        run_case(64'd4);
        run_case(64'd15);
        run_case(64'd16);
        run_case(64'd17);
        run_case(64'd24);
        run_case(64'd25);
        run_case(64'd26);
        run_case(64'd1000);
        run_case(64'd1_000_000_000);
        run_case(64'h0000_0001_0000_0000);
        run_case(64'h7FFF_FFFF_FFFF_FFFF);
        run_case(64'hFFFF_FFFF_FFFF_FFFF);

        for (n = 0; n < 20; n = n + 1) begin
            rnd = {$random, $random};
            run_case(rnd);
        end

        if (errors == 0) begin
            $display("ALL TESTS PASSED");
        end else begin
            $display("TESTS FAILED: %0d errors", errors);
        end

        $finish;
    end
endmodule
