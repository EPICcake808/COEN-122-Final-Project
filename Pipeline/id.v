
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


module instruction_decode(clk, instr_in, rt, data_in, PC, Zero, Neg);
  input clk;
  input [31:0] instr_in;
  input [5:0] rt;
  input [31:0] data_in;
  input [31:0] PC;
  wire ALUSrc;
  wire [2:0] ALUOp;
  wire MemRead;
  wire MemWrite;
  wire PC_Control;
  wire BranchN;
  wire BranchZ;
  wire MemtoReg;
  wire Jump;
  wire RegWrite;
  wire JumpM;
  input Zero;
  input Neg;
  
  wire branch_out;
  wire branchN_out;
  wire branchZ_out;

  wire [31:0] rs_out;
  wire [31:0] rt_out;
  wire [31:0] imm_out;
  wire [31:0] PC_out;

  controlblock control(clk, instr_in[31:28], ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, BranchN, BranchZ, MemtoReg, Jump, RegWrite, JumpM); 

  register_file regfile(clk, RegWrite, instr_in[21:16], instr_in[15:10], rt, data_in, rs_out, rt_out);

  immgen imm(instr_in[21:0], imm_out);

  and(BranchZ, Zero, branchZ_out);
  and(BranchN, Neg, branchN_out);
  or(branchZ_out, branchN_out, branch_out);
  
endmodule