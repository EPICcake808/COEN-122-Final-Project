`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2022 08:48:10 AM
// Design Name: 
// Module Name: tbalu
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


module tb_id();
  reg clk;
  reg [31:0] data_in;
  reg [31:0] PC;
  reg [31:0] instr_in;
  reg ALUSrc;
  reg [2:0] ALUOp;
  reg MemRead;
  reg MemWrite;
  reg PC_Control;
  reg BranchN;
  reg BranchZ;
  reg MemtoReg;
  reg Jump;
  reg RegWrite;
  reg JumpM;
  reg Zero;
  reg Neg;
  
  reg branch_out;
  reg branchN_out;
  reg branchZ_out;

  wire [31:0] rs_out;
  wire [31:0] rt_out;
  wire [31:0] imm_out;
  wire [31:0] PC_out;
  
  initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

id test(clk, instr_in, data_in, PC, Zero, Neg, ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, BranchN, BranchZ, MemtoReg, RegWrite, Jump, JumpM, rs_out, rt_out, imm_out, PC_out);    

  initial
  begin
      data_in = 32'b00000000000000000000000000000000;
      PC = 4;
      instr_in = 32'b00000000000000000000000000000000;
      ALUSrc = 0;
      ALUOp = 4'b000;
      MemRead = 0;
      MemWrite = 0;
      PC_Control = 0;
      BranchN = 0;
      BranchZ = 0;
      MemtoReg = 0;
      Jump = 0;
      RegWrite = 0;
      JumpM = 0;
      Zero = 0;
      Neg = 0;
      
      //#50
   end
      

  
endmodule
