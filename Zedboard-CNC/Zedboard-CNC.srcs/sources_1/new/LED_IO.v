`timescale 1ns / 1ps

module LED_IO(
    input rstSwitch,
    input [31:0] X,
    input [31:0] Y,
    input [31:0] Z,
    input [7:0] SPEED,
    input [3:0] PS_Channel,
    input [3:0] PL_State,
    
    output reg [3:0] PL_Channel,
    output [7:0] led
    );

    always @(*) begin
        if(rstSwitch == 1'b1) begin
            // inform software layer on hardware reset
            PL_Channel = 4'b1111;
        end else begin
            // pass state forward
            PL_Channel = PL_State;
            end
    end
    
    
    // leds for each module
    assign led[3:0] = PS_Channel;
    assign led[7:4] = PL_Channel;
   
endmodule
