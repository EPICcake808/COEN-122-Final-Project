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
    wire  IFJump;
    wire  IFJumpM;
    wire  IFBranch;
    wire [31:0] IFinstr;
    wire [31:0] IFPC;
    wire [31:0] IDPC;
    wire [31:0] IDinstr;
    wire [5:0] IDrd;
    
    instruction_fetch iftest(clk, IFALU_result, IFread_data, IFrs1, IFJump, IFJumpM, IFBranch, IFinstr, IFPC);
    IF_ID ifid(clk, IFPC, IFinstr, IDPC, IDinstr);
    
    // id 
    wire [31:0] IDdatawrite;
    wire [31:0] IDPC_out;
    wire [31:0] IDR1;
    wire [31:0] IDR2;
    wire [31:0] IDimmgen;
    wire IDBranch, IDALUSrc, IDMemRead, IDMemWrite, IDPCControl, IDMemtoReg, IDJump, IDRegWrite, IDJumpM, IDZero, IDNeg;
    wire [2:0] IDALUOp;
    wire [31:0] EXPC;
    wire [31:0] EXR1;
    wire [31:0] EXR2;
    wire [31:0] EXimmgen;
    wire EXALUSrc, EXMemRead, EXMemWrite, EXPCControl, EXMemtoReg, EXJump, EXRegWrite, EXJumpM;
    wire [2:0] EXALUOp;
    wire [5:0] EXrd_in;
    wire [5:0] EXrd_out;
    
    id idtest(clk, IDinstr, IDdatawrite, IDPC, IDBranch, IDPC_out, IDR1, IDR2, IDimmgen, WBrd, WBRegWrite, IDALUSrc, IDMemRead, IDMemWrite, IDPCControl, IDMemtoReg, IDJump, IDRegWrite, IDJumpM, IDZero, IDNeg, IDALUOp, IDrd);
    ID_EX_M idexm(clk, IDPC_out, IDR1, IDR2, IDimmgen, IDrd, IDALUSrc, IDALUOp, IDMemRead, IDMemWrite, IDPCControl, IDMemtoReg, IDJump, IDRegWrite, IDJumpM, EXPC, EXR1, EXR2, EXimmgen, EXrd_in, EXALUSrc, EXALUOp, EXMemRead, EXMemWrite, EXPCControl, EXMemtoReg, EXJump, EXRegWrite, EXJumpM);
    
    assign IFBranch = IDBranch;
    assign IFrs1 = IDR1;
    
    // ex m
    wire [31:0] EXALU_result;
    wire [31:0] EXread_data;
    wire EXZero, EXNeg, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out;
    wire WBZero, WBNeg, WBMemtoReg, WBJump, WBRegWrite, WBJumpM;
    wire [31:0] WBALU_result;
    wire [31:0] WBread_data;
    wire [31:0] testinput1;
    wire [31:0] testinput2;
    wire [5:0] WBrd;
    
    EX_M exmtest(clk, EXPC, EXR1, EXR2, EXimmgen, EXrd_in, EXALUSrc, EXALUOp, EXPCControl, EXMemRead, EXMemWrite, EXMemtoReg, EXJump, EXRegWrite, EXJumpM, EXALU_result, EXZero, EXNeg, EXread_data,EXrd_out, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out, testinput1, testinput2);
    EX_M_WB exmwb(clk, EXZero, EXNeg, EXALU_result, EXread_data, EXrd_out, EXMemtoReg_out, EXJump_out, EXRegWrite_out, EXJumpM_out, WBZero, WBNeg, WBALU_result, WBread_data, WBrd, WBMemtoReg, WBJump, WBRegWrite, WBJumpM);
    
    assign IDZero = EXZero;
    assign IDNeg = EXNeg;
    
    // wb
    wire [31:0] WBwrite_data;
    write_back wbtest(WBALU_result, WBread_data, WBMemtoReg, WBwrite_data);
    
    assign IFJumpM = WBJumpM;
    assign IFJump = WBJump;
    assign IFALU_result = WBALU_result;
    assign IFread_data = WBread_data;
    assign IDdatawrite = WBwrite_data;
    
    initial
    begin
        clk = 1;
        forever #5 clk = ~clk;
    end

endmodule