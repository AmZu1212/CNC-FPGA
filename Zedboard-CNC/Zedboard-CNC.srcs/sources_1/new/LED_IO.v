module LED_IO(
	input mount_ok,
	input mount_fail,
	input [1:0] PL_Phase,
	input [1:0] PS_Phase,
	input in1,
	input in2,
	output [7:0] led
    );

	assign led [0] = mount_ok;
	assign led [1] = mount_fail;
	assign led [3:2] = PL_Phase;
	assign led [5:4] = PS_Phase;
	assign led [6] = in1;
	assign led [7] = in2;
endmodule
