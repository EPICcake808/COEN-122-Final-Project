`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2022 02:38:32 PM
// Design Name: 
// Module Name: ALU
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

module write_back(clk, AlU_result, read_data, MemtoReg, mux_output)
  input clk;
  input [31:0] ALU_result;
  input [31:0] read_data;
  input MemtoReg;
  output reg [31:0] mux_output;
  
  mux21 m1(mux_output, read_data, ALU_result, mux_output);
  
endmodule
