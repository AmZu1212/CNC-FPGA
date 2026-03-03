`timescale 1ns/1ps
`define START_TIMEOUT_CYCLES 50
`define DONE_TIMEOUT_CYCLES  500

module divide_u64_tb;
    reg         clk;
    reg         rst;
    reg         start;
    reg  [63:0] numerator;
    reg  [63:0] denominator;
    wire [63:0] quotient;
    wire [63:0] remainder;
    wire        busy;
    wire        done;
    wire        div_by_zero;

    integer     errors;

    divide_u64 dut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .numerator(numerator),
        .denominator(denominator),
        .quotient(quotient),
        .remainder(remainder),
        .busy(busy),
        .done(done),
        .div_by_zero(div_by_zero)
    );

    always #5 clk = ~clk;

    task run_case;
        input [63:0] num_i;
        input [63:0] den_i;
        reg   [63:0] exp_q;
        reg   [63:0] exp_r;
        integer timeout;
        begin
            if (den_i == 64'd0) begin
                exp_q = 64'd0;
                exp_r = num_i;
            end else begin
                exp_q = num_i / den_i;
                exp_r = num_i % den_i;
            end

            @(posedge clk);
            numerator   <= num_i;
            denominator <= den_i;
            start       <= 1'b1;
            @(posedge clk);
            start       <= 1'b0;
            @(posedge clk);

            timeout = 0;
            while (!busy && !done && timeout < `START_TIMEOUT_CYCLES) begin
                @(posedge clk);
                timeout = timeout + 1;
            end

            timeout = 0;
            while ((busy || !done) && timeout < `DONE_TIMEOUT_CYCLES) begin
                @(posedge clk);
                timeout = timeout + 1;
            end

            if (busy || !done) begin
                $display("TIMEOUT: num=%0d den=%0d", num_i, den_i);
                errors = errors + 1;
            end else if (den_i == 64'd0) begin
                if (!div_by_zero || quotient !== exp_q || remainder !== exp_r) begin
                    $display("FAIL(DBZ): num=%0d den=%0d q=%0d r=%0d dbz=%0b", num_i, den_i, quotient, remainder, div_by_zero);
                    errors = errors + 1;
                end else begin
                    $display("PASS(DBZ): num=%0d den=%0d q=%0d r=%0d", num_i, den_i, quotient, remainder);
                end
            end else if (div_by_zero || quotient !== exp_q || remainder !== exp_r) begin
                $display(
                    "FAIL: num=%0d den=%0d exp_q=%0d got_q=%0d exp_r=%0d got_r=%0d dbz=%0b",
                    num_i, den_i, exp_q, quotient, exp_r, remainder, div_by_zero
                );
                errors = errors + 1;
            end else begin
                $display("PASS: num=%0d den=%0d q=%0d r=%0d cycles=%0d", num_i, den_i, quotient, remainder, timeout);
            end

            @(posedge clk);
        end
    endtask

    integer n;
    reg [63:0] rnd_num;
    reg [63:0] rnd_den;

    initial begin
        $dumpfile("outputs/divide_u64_tb.vcd");
        $dumpvars(0, divide_u64_tb);

        clk         = 1'b0;
        rst         = 1'b1;
        start       = 1'b0;
        numerator   = 64'd0;
        denominator = 64'd0;
        errors      = 0;

        repeat (3) @(posedge clk);
        rst = 1'b0;

        run_case(64'd0, 64'd1);
        run_case(64'd1, 64'd1);
        run_case(64'd2, 64'd1);
        run_case(64'd7, 64'd3);
        run_case(64'd1000, 64'd7);
        run_case(64'hFFFF_FFFF_FFFF_FFFF, 64'd1);
        run_case(64'hFFFF_FFFF_FFFF_FFFF, 64'd2);
        run_case(64'hFFFF_FFFF_FFFF_FFFF, 64'hFFFF_FFFF);
        run_case(64'h1234_5678_9ABC_DEF0, 64'h1111_1111);
        run_case(64'h7FFF_FFFF_FFFF_FFFF, 64'd123456789);
        run_case(64'd123, 64'd0);

        for (n = 0; n < 20; n = n + 1) begin
            rnd_num = {$random, $random};
            rnd_den = {$random, $random};
            if (rnd_den == 64'd0) begin
                rnd_den = 64'd1;
            end
            run_case(rnd_num, rnd_den);
        end

        if (errors == 0) begin
            $display("ALL TESTS PASSED");
        end else begin
            $display("TESTS FAILED: %0d errors", errors);
        end

        $finish;
    end
endmodule
