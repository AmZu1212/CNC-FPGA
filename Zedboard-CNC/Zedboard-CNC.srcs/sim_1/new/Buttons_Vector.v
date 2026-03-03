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
    input left,
    input right,
    input up,
    input down,
    input Zswitch,
    output [4:0] keys
    );
                                                // 4, 3, 2, 1, 0 -> annoying, i know.
assign keys = {Zswitch, up, down, right, left}; // -x, +x, -y/z, +y/z, zswitch.
endmodule
