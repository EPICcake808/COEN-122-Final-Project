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

//    reg clk;
    
//    // if wires
//    wire [31:0] IFPC_in;
//    wire [31:0] IFadder_out;    

//    wire [31:0] PC_in;
//    wire [31:0] data1;
//    wire [31:0] data2;
    
//    wire [31:0] imm_in;
//    wire ALUSrc_in;
//    wire [2:0] ALUOp_in;
//    wire MemRead_in;
//    wire MemWrite_in;
//    wire PC_Control_in;
//    wire MemtoReg_in;
//    wire Jump_in;
//    wire RegWrite_in;
//    wire JumpM_in;

//    wire [31:0] PC_out;
//    wire [31:0] reg1;
//    wire [31:0] reg2;
//    wire [31:0] imm_out;
//    wire ALUSrc_out;
//    wire [2:0] ALUOp_out;
//    wire MemRead_out;
//    wire MemWrite_out;
//    wire PC_Control_out;
//    wire MemtoReg_out;
//    wire Jump_out;
//    wire RegWrite_out;
//    wire JumpM_out;
    
    // if
//    PCAdder adder(PC_out, adder_out);
    
//    mux21_32bit m1(m1_out, ALU_result, adder_out, Jump_out);
//    mux21_32bit m2(m2_out, read_data, m1_out, JumpM_out);
//    mux21_32bit m3(m3_out, rs1, m2_out, Branch_out);
//    ProgramCounter pc(m3_out, PC_out, clk);
//    instruction_memory im(clk, PC_out, instr_out);
    wire clk;
    wire [31:0] IFALU_result;
    wire [31:0] IFread_data;
    wire [31:0] IFrs1;
    wire [31:0] IFJump;
    wire [31:0] IFJumpM;
    wire [31:0] IFBranch;
    wire [31:0] IFinstr;
    wire [31:0] IFPC;
    wire [31:0] IDPC;
    wire [31:0] IDinstr;
    
    instruction_fetch iftest(clk, IFALU_result, IFread_data, IFrs1, IFJump, IFJumpM, IFBranch, IFinstr_out, IFPC);
    IF_ID ifid(clk, IFPC, IFinstr, IDPC, IDinstr);
    
    // id
//    controlblock control(clk, instr_in[31:28], ALUSrc_in, ALUOp_in, MemRead_in, MemWrite_in, PC_Control_in, BranchN_in, BranchZ_in, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in); 
//    register_file regfile(clk, RegWrite_in, instr_in[27:22], instr_in[21:16], instr_in[15:10], data_in, rs_out, rt_out);
//    immgen imm(instr_in[21:0], imm_out);
//    and(BranchZ, Zero_out, branchZ_out);
//    and(BranchN, Neg_out, branchN_out);
//    or(branchZ_out, branchN_out, branch_out);
    
    wire [31:0] IDdatawrite;
    wire [31:0] IDPC_out;
    wire [31:0] IDR1;
    wire [31:0] IDR2;
    wire [21:0] IDimmgen;
    wire IDBranch, IDALUSrc, IDMemRead, IDMemWrite, IDPCControl, IDMemtoReg, IDJump, IDRegWrite, IDJumpM, IDZero, IDNeg, IDALUOp;
    
    wire [31:0] EXPC;
    wire [31:0] EXR1;
    wire [31:0] EXR2;
    wire [31:0] EXimmgen;
    wire EXALUSrc, EXALUOp, EXMemRead, EXMemWrite, EXPCControl, EXMemtoReg, EXJump, EXRegWrite, EXJumpM;
    
    id idtest(clk, IDinstr, IDdatawrite, IDPC, IDBranch, IDPC_out, IDR1, IDR2, IDimmgen, IDALUSrc, IDMemRead, IDMemWrite, IDPCControl, IDMemtoReg, IDJump, IDRegWrite, IDJumpM, IDZero, IDNeg, IDALUOp);
    ID_EX_M idexm(clk, IDPC_out, IDR1, IDR2, IDimmgen, IDALUSrc, IDALUOp, IDMemRead, IDMemWrite, IDPCControl, IDMemtoReg, IDJump, IDRegWrite, IDJumpM, EXPC, EXR1, EXR2, EXimmgen, EXALUSrc, EXALUOp, EXMemRead, EXMemWrite, EXPCControl, EXMemtoReg, EXJump, EXRegWrite, EXJumpM);
    
    assign IFBranch = IDBranch;
    
    // ex m
//    mux21_32bit m4(input1, PC, rs1, PC_Control);
//    mux21_32bit m5(input2, immgen, rs2, ALUSrc);
//    alu32bit alu1(input1, input2, add, inc, neg, sub, ALU_result, Zero_out, Neg_out);
//    data_memory dm(clk, MemRead, MemWrite, rs1, rs2, read_data);
    
    wire [31:0] EXALU_result;
    wire [31:0] EXread_data;
    wire EXZero, EXNeg, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out;
    wire WBZero, WBNeg, WBMemtoReg, WBJump, WBRegWrite, WBJumpM;
    wire [31:0] WBALU_result;
    wire [31:0] WBread_data;
    
    EX_M exmtest(clk, EXPC, EXR1, EXR2, EXimmgen, EXALUSrc, EXALUOp, EXPCControl, EXMemRead, EXMemWrite, EXMemtoReg, EXJump, EXRegWrite, EXJumpM, EXALU_result, EXZero, EXNeg, EXread_data, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out);
    EX_M_WB exmwb(clk, EXZero, EXNeg, EXALU_result, EXread_data, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out, WBZero, WBNeg, WBALU_result, WBread_data, WBMemtoReg, WBJump, WBRegWrite, WBJumpM);
    
    // wb
    //mux21_32bit m6(mux_output, read_data, ALU_result, mux_output);

    wire [31:0] WBALU_result;
    wire [31:0] WBread_data;
    
    write_back wbtest(clk, WBALU_result, WBread_data, WBMemtoReg);
    
    assign IFJumpM = WBJumpM;
    assign IFJump = WBJump;
    assign IDRegWrite = WBRegWrite;

endmodule
