`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2022 02:24:24 PM
// Design Name: 
// Module Name: buffer
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

//This is the buffer for IF to ID
module IF_ID(clk, PC_in, inst_mem, PC_out, inst_out);
    input [7:0] PC_in;
    input [31:0] inst_mem;
    input clk;
    output reg [7:0] PC_out;
    output reg [31:0] inst_out;
    
    always@(posedge clk)
        begin
             PC_out = PC_in;
             inst_out = inst_mem;
        end
    
endmodule

//This is the buffer for ID to EX
module ID_EX_M(clk, PC_in, data1, data2, imm_in, ALUSrc_in, ALUOp_in, MemWrite_in, PC_Control_in,  MemtoReg_in, Jump_in, RegWrite_in, JumpM_in, PC_out, reg1, reg2, imm_out, ALUSrc_out, ALUOp_out, MemWrite_out, PC_Control_out, MemtoReg_out, Jump_out, RegWrite_out, JumpM_out);
    input [31:0] PC_in;
    input [31:0] data1;
    input [31:0] data2;
    input [31:0] imm_in;
    input ALUSrc_in;
    input [2:0] ALUOp_in;
    input MemRead_in;
    input MemWrite_in;
    input PC_Control_in;
    input MemtoReg_in;
    input Jump_in;
    input RegWrite_in;
    input JumpM_in;
    input clk;
    output reg [31:0] PC_out;
    output reg [31:0] reg1;
    output reg [31:0] reg2;
    output reg [31:0] imm_out;
    output reg ALUSrc_out;
    output reg [2:0] ALUOp_out;
    output reg MemRead_out;
    output reg MemWrite_out;
    output reg PC_Control_out;
    output reg MemtoReg_out;
    output reg Jump;
    output reg RegWrite;
    output reg JumpM;
    
    always@(posedge clk)
        begin
             PC_out = PC_in;
             reg1 = data1;
             reg2 = data2;
             imm_out = imm_in;
             ALUSrc_out = ALUSrc_in;
             ALUOp_out = ALUOp_in;
             MemRead_out = MemRead_in;
             MemWrite_out = MemWrite_in;
             PC_Control_out = PC_Control_in;
             MemtoReg_out = MemtoReg_in;
             Jump_out = Jump_in;
             RegWrite_out = RegWrite_in;
             JumpM_out = JumpM_in;
        end
endmodule 

//This is the buffer for EX to MEM
module EX_M_WB (clk, Zero_in, Neg_in, ALU_in, reg2_in, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in, Zero_out, Neg_out, ALU_out, reg2_out,  MemtoReg_out, Jump_out, RegWrite_out, JumpM_out);
    input Zero_in;
    input Neg_in;
    input [31:0] ALU_in;
    input [31:0] reg2_in;
    input MemtoReg_in;
    input Jump_in;
    input RegWrite_in;
    input JumpM_in;
    input clk;
    output reg Zero_out;
    output reg Neg_out;
    output reg [31:0] ALU_out;
    output reg [31:0] reg2_out;
    output reg MemtoReg_out;
    output reg Jump;
    output reg RegWrite;
    output reg JumpM;
    
    always@(posedge clk)
        begin
             Zero_out = Zero_in;
             Neg_out = Neg_in;
             reg2_out = reg2_in;
             ALU_out = ALU_in;
        end
endmodule 



    
