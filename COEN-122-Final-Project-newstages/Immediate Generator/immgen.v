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


module immgen(instr, immout);
    input [31:0] instr;
    output reg [31:0] immout;
    
    always @(*) //if we need Clk, just add the Clk here
    begin
        case(instr[31:28])
        4'b0101: begin
                    immout[31:0] = {{16{instr[15]}}, instr[15:0]};
                end
        4'b1111: begin
                    immout[31:0] = {{10{instr[21]}}, instr[21:0]};
                end
        endcase
    end
endmodule
