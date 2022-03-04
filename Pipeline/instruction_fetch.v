
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ian Ohari
// 
// Create Date: 01/25/2022 02:59:30 PM
// Design Name: 8 Bit ALU
// Module Name: alu
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


module instruction_fetch(clk, ALU_result, read_data, rs1, Jump, JumpM, Branch);
  input [31:0] ALU_result;
  input [31:0] read_data;
  input [31:0] rs1;
  input Jump;
  input JumpM;
  input Branch;
  input clk;
  
  wire [31:0] adder_out;
  wire [31:0] m1_out;
  wire [31:0] m2_out;
  wire [31:0] m3_out;
  wire [31:0] PC_out;
  wire [31:0] instr_out;
  
  PCAdder adder(PC_out, adder_out);
  
  mux21_32bit m1(m1_out, ALU_result, adder_out, Jump);
  mux21_32bit m2(m2_out, read_data, m1_out, JumpM);
  mux21_32bit m3(m3_out, rs1, m2_out, Branch);
  
  ProgramCounter pc(m3_out, PC_out, clk);
  
  instruction_memory im(clk, PC_out, instr_out);
  
endmodule

  
  
  
