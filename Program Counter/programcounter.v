`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ian Ohari
// 
// Create Date: 02/10/2022 09:40:48 AM
// Design Name: 
// Module Name: programcounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Program Counter and the Program Counter Adder
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module ProgramCounter(PCNext, PCResult, Clk);
    input [31:0] PCNext;
    input Clk;
    output reg [31:0] PCResult;
    
//Implemented in testbench (I think)    
/*    
    initial
    begin
        PCResult <= 32'h00000000;
    end
*/    
    always @(posedge Clk)
    begin
        PCResult <= PCNext;
    end
endmodule

module PCAdder(PCResult, PCAddResult);
    input [31:0] PCResult;
    output reg [31:0] PCAddResult;
    
    always @(PCResult)
    begin
        PCAddResult <= PCResult + 32'h00000004;
    end
endmodule
