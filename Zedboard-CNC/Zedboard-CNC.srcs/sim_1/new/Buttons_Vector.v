/////////////////////////////////////////////////////////////////////////////////
// Company: The Technion
// Engineer: Amir Zuabi & Alex Vassiliev
// 
// Create Date: 06/18/2025 01:14:28 AM
// Design Name: 
// Module Name: Buttons_Vector
// Project Name: CNC-FPGA
// Target Devices: Zedboard Devkit
// Tool Versions: Vivado 2024.2
// Description: 
// Dependencies: 
//  Vivado 2024.2
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
/////////////////////////////////////////////////////////////////////////////////


module Buttons_Vector(
    input X_POS,
    input X_NEG,
    input Y_POS,
    input Y_NEG,
    input Z_POS,
    input Z_NEG,
    
    output [5:0] keys
    );

assign keys = {X_POS, X_NEG, Y_POS, Y_NEG, Z_POS, Z_NEG};

endmodule
