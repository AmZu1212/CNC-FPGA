`timescale 1ns/1ps

// NOTE: This is an integer square root. so results like 2.7 are trunicated to 2.
module sqrt_root (
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
    input  wire [63:0] in_value,
    output reg  [63:0] root,
    output reg         done,
    output reg         busy
);

    reg [63:0] val;
    reg [63:0] res;
    reg [63:0] bit_mask;
    reg [6:0]  i;

    always @(posedge clk) begin
        if (rst) begin
            val  <= 64'd0;
            res  <= 64'd0;
            bit_mask <= 64'd0;
            i    <= 7'd0;
            root <= 64'd0;
            done <= 1'b0;
            busy <= 1'b0;
        end else begin
            if (start && !busy) begin
                val  <= in_value;
                res  <= 64'd0;
                bit_mask <= 64'h4000_0000_0000_0000;
                i    <= 7'd0;
                done <= 1'b0;
                busy <= 1'b1;
            end else if (busy) begin
                if (i == 7'd0 && bit_mask > val) begin
                    bit_mask <= (bit_mask >> 2);
                end else if (i < 7'd32 && bit_mask != 64'd0) begin
                    if (val >= (res + bit_mask)) begin
                        val <= val - (res + bit_mask);
                        res <= (res >> 1) + bit_mask;
                    end else begin
                        res <= (res >> 1);
                    end
                    bit_mask <= (bit_mask >> 2);
                    i   <= i + 1'b1;
                end else begin
                    root <= res;
                    done <= 1'b1;
                    busy <= 1'b0;
                end
            end
        end
    end

endmodule
