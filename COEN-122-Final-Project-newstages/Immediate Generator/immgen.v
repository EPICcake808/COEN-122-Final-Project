`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ian Ohari
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


module immgen(Clk, immin, immout);
    input Clk;
    input [21:0] immin;
    output reg [31:0] immout;
    
    always @(posedge Clk) //if we need Clk, just add the Clk here
    begin
        immout[31:0] = {{10{immin[21]}}, immin[21:0]};
    end
endmodule
