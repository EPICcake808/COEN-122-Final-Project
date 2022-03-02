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


module ProgramCounter(PCin, PCout, Clk);
    input [31:0] PCin
    input Clk;
    output reg [31:0] PCout;
    
//Implemented in testbench (I think)    
/*    
    initial
    begin
        PCResult <= 32'h00000000;
    end
*/
    initial
    begin
        PCin = 0;
    end
    
    always @(posedge Clk)
    begin
        if(PCin)
            PCout = PCin;
    end
endmodule

module PCAdder(PCout, PCAddResult);
    input [31:0] PCout;
    output reg [31:0] PCAddResult;
    
    always @(PCout)
    begin
        PCAddResult = PCout + 32'h00000004;
    end
endmodule
