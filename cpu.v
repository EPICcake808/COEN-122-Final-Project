`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 12:58:00 PM
// Design Name: 
// Module Name: cpu
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


module cpu();

  // if
  PCAdder adder(PC_out, adder_out);
  
  mux21_32bit m1(m1_out, ALU_result, adder_out, Jump_out);
  mux21_32bit m2(m2_out, read_data, m1_out, JumpM_out);
  mux21_32bit m3(m3_out, rs1, m2_out, Branch_out);
  ProgramCounter pc(m3_out, PC_out, clk);
  instruction_memory im(clk, PC_out, instr_out);

  IF_ID ifid(clk, PC_in, inst_mem, PC_out, inst_out);

  // id
  controlblock control(clk, instr_in[31:28], ALUSrc_in, ALUOp_in, MemRead_in, MemWrite_in, PC_Control_in, BranchN_in, BranchZ_in, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in); 
  register_file regfile(clk, RegWrite_in, instr_in[27:22], instr_in[21:16], instr_in[15:10], data_in, rs_out, rt_out);
  immgen imm(instr_in[21:0], imm_out);
  and(BranchZ, Zero_out, branchZ_out);
  and(BranchN, Neg_out, branchN_out);
  or(branchZ_out, branchN_out, branch_out);
  
  ID_EX_M idexm(clk, PC_in, data1, data2, imm_in, ALUSrc_in, ALUOp_in, MemRead_in, MemWrite_in, PC_Control_in,  MemtoReg_in, Jump_in, RegWrite_in, JumpM_in, PC_out, reg1, reg2, imm_out, ALUSrc_out, ALUOp_out, MemRead_out, MemWrite_out, PC_Control_out, MemtoReg_out, Jump_out, RegWrite_out, JumpM_out);

  // ex m
  mux21_32bit m4(input1, PC, rs1, PC_Control);
  mux21_32bit m5(input2, immgen, rs2, ALUSrc);
  alu32bit alu1(input1, input2, add, inc, neg, sub, ALU_result, Zero_out, Neg_out);
  data_memory dm(clk, MemRead, MemWrite, rs1, rs2, read_data);

  EX_M_WB exmwb(clk, Zero_in, Neg_in, ALU_in, reg2_in, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in, Zero_out, Neg_out, ALU_out, reg2_out,  MemtoReg_out, Jump_out, RegWrite_out, JumpM_out);

  // wb
  mux21_32bit m6(mux_output, read_data, ALU_result, mux_output);

endmodule
