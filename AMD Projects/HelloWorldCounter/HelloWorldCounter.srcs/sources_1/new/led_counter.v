module led_counter (
    input wire clk,
    output reg [7:0] led
);

    reg [26:0] clk_div = 0;  // Enough to count to 100 million
    reg tick = 0;

    always @(posedge clk) begin
        if (clk_div == 100_000_000 - 1) begin  // 1-second delay
            clk_div <= 0;
            tick <= 1;
        end else begin
            clk_div <= clk_div + 1;
            tick <= 0;
        end
    end

    always @(posedge clk) begin
        if (tick)
            led <= led + 1;
    end
endmodule
