`timescale 1ns / 1ps

module LED_IO(
    input [31:0] X,
    input [31:0] Y,
    input [31:0] Z,
    input [7:0] SPEED,
    input [7:0] PS_Channel,
    input rstSwitch,
    output [7:0] PL_Channel,
    output [7:0] led
    );

    // Turn on LEDs when corresponding channel is non-zero.
    // led[0]=X, led[1]=Y, led[2]=Z, led[3]=CMD, led[4]=PS_Channel.
//    assign led[0]   = (X          != 32'd0);
//    assign led[1]   = (Y          != 32'd0);
//    assign led[2]   = (Z          != 32'd0);
//    assign led[3]   = (SPEED        != 8'd0);
//    assign led[4]   = (PS_Channel != 8'd0);
//    assign led[7:5] = 3'b000;
    assign led = SPEED;
    // When switch is high, drive PL_Channel with 1 for a simple loopback test.
    assign PL_Channel = rstSwitch ? 8'h01 : 8'h00;

endmodule
