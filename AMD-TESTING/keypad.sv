`timescale 1ns / 1ps


// ==============================================================================================
// 		Define Module
// ==============================================================================================
module keypad(
    input logic clk,			// 100MHz on board clock
    input logic [3:0]  Row,		// Rows on KYPD
    output logic [3:0]  Col,		// Columns on KYPD
	output logic [31:0]  key,
	output logic [31:0]  released
    );


	logic [19:0] sclk;

// ==============================================================================================
// 			Implementation
// ==============================================================================================

	always_ff @(posedge clk) begin

			// 1ms
			if (sclk == 20'h186A0) begin
				//C1
				Col <= 4'b0111;
				sclk <= sclk + 1'b1;
			end
			
			// check row pins
			else if(sclk == 20'h186A8) begin
				//R1
				
				if (Row == 4'b0111) begin
					key[3:0] <= 4'b0001;		//1
				end
				//R2
				else if(Row == 4'b1011) begin
					key[3:0] <= 4'b0100; 		//4
				end
				//R3
				else if(Row == 4'b1101) begin
					key[3:0] <= 4'b0111; 		//7
				end
				//R4
				else if(Row == 4'b1110) begin
					key[3:0] <= 4'b0000; 		//0
				end

				if (Row != 4'b1111) begin
					released[0] <= 1'b0; // reset when a key is pressed
				end else begin
					released[0] <= 1'b1; // set when no key is pressed
				end
				sclk <= sclk + 1'b1;
			end

			// 2ms
			else if(sclk == 20'h30D40) begin
				//C2
				Col<= 4'b1011;
				sclk <= sclk + 1'b1;
			end
			
			// check row pins
			else if(sclk == 20'h30D48) begin
				//R1
				
				if (Row == 4'b0111) begin
					key[3:0] <= 4'b0010; 		//2
				end
				//R2
				else if(Row == 4'b1011) begin
					key[3:0] <= 4'b0101; 		//5
				end
				//R3
				else if(Row == 4'b1101) begin
					key[3:0] <= 4'b1000; 		//8
				end
				//R4
				else if(Row == 4'b1110) begin
					key[3:0] <= 4'b1111;    //F
				end

				if (Row != 4'b1111) begin
					released[0] <= 1'b0; // reset when a key is pressed
				end else begin
					released[0] <= 1'b1; // set when no key is pressed
				end
				sclk <= sclk + 1'b1;
			end

			//3ms
			else if(sclk == 20'h4_9_3_E_0) begin
				//C3
				Col<= 4'b1101;
				sclk <= sclk + 1'b1;
			end
			
			// check row pins
			else if(sclk == 20'h493E8) begin
				//R1
				
				if(Row == 4'b0111) begin
					key[3:0] <= 4'b0011; 		//3	
				end
				//R2
				else if(Row == 4'b1011) begin
					key[3:0] <= 4'b0110; 		//6
				end
				//R3
				else if(Row == 4'b1101) begin
					key[3:0] <= 4'b1001; 		//9
				end
				//R4
				else if(Row == 4'b1110) begin
					key[3:0] <= 4'b1110; 		//E
				end

				if (Row != 4'b1111) begin
					released[0] <= 1'b0; // reset when a key is pressed
				end else begin
					released[0] <= 1'b1; // set when no key is pressed
				end

				sclk <= sclk + 1'b1;
			end

			//4ms
			else if(sclk == 20'h61A80) begin
				//C4
				Col<= 4'b1110;
				sclk <= sclk + 1'b1;
			end

			// Check row pins
			else if(sclk == 20'h61A88) begin
				//R1
			
				if(Row == 4'b0111) begin
					key[3:0] <= 4'b1010; //A
				end
				//R2
				else if(Row == 4'b1011) begin
					key[3:0] <= 4'b1011; //B
				end
				//R3
				else if(Row == 4'b1101) begin
					key[3:0] <= 4'b1100; //C
				end
				//R4
				else if(Row == 4'b1110) begin
					key[3:0] <= 4'b1101; //D
				end
				
				if (Row != 4'b1111) begin
					released[0] <= 1'b0; // reset when a key is pressed
				end else begin
					released[0] <= 1'b1; // set when no key is pressed
				end
				sclk <= 20'h0_0_0_0;
			end

			// Otherwise increment
			else begin
				sclk <= sclk + 1'b1;
			end
			
	end

assign key[31:4] = 28'b0;

// released 

endmodule
