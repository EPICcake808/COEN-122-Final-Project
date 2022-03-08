`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 12:22:16 AM
// Design Name: 
// Module Name: id
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


module id(clk, instr_in, data_in, PC, Zero, Neg, ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, BranchN, BranchZ, MemtoReg, RegWrite, Jump, JumpM, rs_out, rt_out, imm_out, PC_out);
  input clk;
  //input [31:0] rt;
  input [31:0] data_in;
  input [31:0] PC;
  input [31:0] instr_in;
  input ALUSrc;
  input [2:0] ALUOp;
  input MemRead;
  input MemWrite;
  input PC_Control;
  input BranchN;
  input BranchZ;
  input MemtoReg;
  input Jump;
  input RegWrite;
  input JumpM;
  input Zero;
  input Neg;
  
  wire branch_out;
  wire branchN_out;
  wire branchZ_out;

  output reg [31:0] rs_out;
  output reg [31:0] rt_out;
  output reg [31:0] imm_out;
  output reg [31:0] PC_out;

  controlblock control(clk, instr_in[31:28], ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, BranchN, BranchZ, MemtoReg, Jump, RegWrite, Jump); 

  register_file regfile(clk, RegWrite, instr_in[21:16], instr_in[15:10], rt, data_in, rs_out, rt_out);

  immgen imm(instr_in[21:0], imm_out);

  and(BranchZ, Zero, branchZ_out);
  and(BranchN, Neg, branchN_out);
  or(branchZ_out, branchN_out, branch_out);
  
endmodule
