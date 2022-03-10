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
    reg clk;
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
    assign IFrs1 = IDR1;
    
    // ex m
    wire [31:0] EXALU_result;
    wire [31:0] EXread_data;
    wire EXZero, EXNeg, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out;
    wire WBZero, WBNeg, WBMemtoReg, WBJump, WBRegWrite, WBJumpM;
    wire [31:0] WBALU_result;
    wire [31:0] WBread_data;
    
    EX_M exmtest(clk, EXPC, EXR1, EXR2, EXimmgen, EXALUSrc, EXALUOp, EXPCControl, EXMemRead, EXMemWrite, EXMemtoReg, EXJump, EXRegWrite, EXJumpM, EXALU_result, EXZero, EXNeg, EXread_data, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out);
    EX_M_WB exmwb(clk, EXZero, EXNeg, EXALU_result, EXread_data, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out, WBZero, WBNeg, WBALU_result, WBread_data, WBMemtoReg, WBJump, WBRegWrite, WBJumpM);
    
    assign IDZero = EXZero;
    assign IDNeg = EXNeg;
    
    // wb
    write_back wbtest(clk, WBALU_result, WBread_data, WBMemtoReg);
    
    assign IFJumpM = WBJumpM;
    assign IFJump = WBJump;
    assign IFALU_result = WBALU_result;
    assign IFread_data = WBread_data
    assign IDRegWrite = WBRegWrite;
    assign IDMemtoReg = WBMemtoReg;
    
    initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end

endmodule
