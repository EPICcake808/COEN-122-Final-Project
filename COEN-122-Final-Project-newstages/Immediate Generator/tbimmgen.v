`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 03:13:09 PM
// Design Name: 
// Module Name: tbimmgen
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


module tbimmgen();
    reg [21:0] A;
    wire [31:0] out;
    
    immgen test(A, out);
    
    initial
    begin
    A = 22'b1010101010101010101010;
    #100;
    A = 22'b0101010101010101010101;
    #100;
    end
endmodule
