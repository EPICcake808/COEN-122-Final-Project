
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


module id(clk, instr_in, data_in, PC, branch_out, PC_out, rs_out, rt_out, imm_out, RegWrite, ALUSrc, MemRead, MemWrite, PC_Control, MemtoReg, Jump, RegWrite_out, JumpM, Zero, Neg, ALUOp);
  input clk;
  input [31:0] instr_in;
  input [31:0] data_in;
  input [31:0] PC;
  output ALUSrc;
  output [2:0] ALUOp;
  output MemRead;
  output MemWrite;
  output PC_Control;
  wire BranchN;
  wire BranchZ;
  output MemtoReg;
  output Jump;
  input RegWrite;
  output RegWrite_out;
  output JumpM;
  input Zero;
  input Neg;
  
  output branch_out;
  wire branchN_out;
  wire branchZ_out;

  output [31:0] PC_out;
  output [31:0] rs_out;
  output [31:0] rt_out;
  output [31:0] imm_out;

  controlblock control(clk, instr_in[31:28], ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, BranchN, BranchZ, MemtoReg, Jump, RegWrite_out, JumpM); 

  register_file regfile(clk, RegWrite, instr_in[27:22], instr_in[21:16], instr_in[15:10], data_in, rs_out, rt_out);

  immgen imm(clk, instr_in[21:0], imm_out);

  and(branchZ_out, BranchZ, Zero);
  and(branchN_out, BranchN, Neg);
  or(branch_out, branchZ_out, branchN_out);
  
  assign PC_out = PC;
  
endmodule
