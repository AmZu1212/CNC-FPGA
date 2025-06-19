/////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Zuabi
// 
// Create Date: 06/17/2025 11:28:23 PM
// Design Name: A4988_Driver_IO Module
// Module Name: A4988_Driver_IO
// Project Name: CNC-FPGA
// Target Devices: Zedboard Devkit
// Tool Versions: Vivado 2024.2
// Description: 
// 	Driver IO in order to link a PMOD connector to a A4988 stepper motor driver.
// Dependencies: 
// Vivado 2024.2
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 	Flips not pin logic.
/////////////////////////////////////////////////////////////////////////////////
module A4988_Driver_IO
(
	// Inputs
	input enable,
	input direction,
	input step,
	//input sleep,
	input reset,
	input ms1,
	input ms2,
	input ms3,
 
	// Outputs
	output drv_enable,
	output drv_direction,
	output drv_step,
	//output reg drv_sleep,
	output drv_reset,
	output drv_ms1,
	output drv_ms2,
	output drv_ms3
	
);

	// Hardwires
	assign drv_direction = direction;  // high = clockwise, low = counter-clockwise
	assign drv_step = step;
	//assign drv_sleep = ~sleep;		// Sleep (active low) - unused in our project (connected to VCC pin)
	assign drv_reset = ~reset;			// Reset (active low)
	assign drv_ms1 = ms1;
	assign drv_ms2 = ms2;
	assign drv_ms3 = ms3;
	assign drv_enable = ~enable;		// Enable (active low) - always on will make whine noise

endmodule
