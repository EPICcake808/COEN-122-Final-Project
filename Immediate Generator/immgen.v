`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 02:30:15 PM
// Design Name: 
// Module Name: immgen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module immgen(immin, immout);
    input [21:0] immin;
    output reg [32:0] immout;
    
    always @(*) //if we need Clk, just add the Clk here
    begin
        immout[31:0] = {{10{immin[21]}}, immin[21:0]};
    end
endmodule
