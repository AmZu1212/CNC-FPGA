`timescale 1ns/1ps

module divide_u64 (
    input  wire        clk,
    input  wire        rst,
    input  wire        start,
    input  wire [63:0] numerator,
    input  wire [63:0] denominator,
    output reg  [63:0] quotient,
    output reg  [63:0] remainder,
    output reg         busy,
    output reg         done,
    output reg         div_by_zero
);

    reg [63:0] numerator_reg;
    reg [63:0] denominator_reg;
    reg [63:0] quotient_work;
    reg [64:0] remainder_work;
    reg [6:0]  bit_index;

    reg [64:0] rem_shifted;
    reg [64:0] rem_next;
    reg [63:0] q_next;

    always @(posedge clk) begin
        if (rst) begin
            numerator_reg   <= 64'd0;
            denominator_reg <= 64'd0;
            quotient_work   <= 64'd0;
            remainder_work  <= 65'd0;
            bit_index       <= 7'd0;
            quotient        <= 64'd0;
            remainder       <= 64'd0;
            busy            <= 1'b0;
            done            <= 1'b0;
            div_by_zero     <= 1'b0;
            rem_shifted     <= 65'd0;
            rem_next        <= 65'd0;
            q_next          <= 64'd0;
        end else begin
            if (start && !busy) begin
                done <= 1'b0;
                if (denominator == 64'd0) begin
                    quotient        <= 64'd0;
                    remainder       <= numerator;
                    busy            <= 1'b0;
                    done            <= 1'b1;
                    div_by_zero     <= 1'b1;
                end else begin
                    numerator_reg   <= numerator;
                    denominator_reg <= denominator;
                    quotient_work   <= 64'd0;
                    remainder_work  <= 65'd0;
                    bit_index       <= 7'd63;
                    busy            <= 1'b1;
                    done            <= 1'b0;
                    div_by_zero     <= 1'b0;
                end
            end else if (busy) begin
                rem_shifted = {remainder_work[63:0], numerator_reg[bit_index]};
                q_next = quotient_work;

                if (rem_shifted >= {1'b0, denominator_reg}) begin
                    rem_next = rem_shifted - {1'b0, denominator_reg};
                    q_next[bit_index] = 1'b1;
                end else begin
                    rem_next = rem_shifted;
                end

                remainder_work <= rem_next;
                quotient_work  <= q_next;

                if (bit_index == 7'd0) begin
                    quotient    <= q_next;
                    remainder   <= rem_next[63:0];
                    busy        <= 1'b0;
                    done        <= 1'b1;
                end else begin
                    bit_index <= bit_index - 1'b1;
                end
            end
        end
    end

endmodule
