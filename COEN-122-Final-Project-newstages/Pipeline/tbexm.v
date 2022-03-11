`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 10:14:21 PM
// Design Name: 
// Module Name: tbexm
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


module tbexm();
    reg Clk;
    reg [31:0] PC;
    reg [31:0] rs1;
    reg [31:0] rs2;
    reg [31:0] immgen;
    reg ALUSrc, PC_Control, MemWrite, MemRead, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in;
    reg [2:0] ALUOp;
    
    wire [31:0] ALU_result;
    wire [31:0] read_data;
    wire Zero, Neg, MemtoReg_out, Jump_out, RegWrite_out, JumpM_out;
    wire [31:0] testr1out;
    wire [31:0] testr2out;
    
    EX_M test(Clk, PC, rs1, rs2, immgen, ALUSrc, ALUOp, PC_Control, MemRead, MemWrite, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in, ALU_result, Zero, Neg, read_data, MemtoReg_out, Jump_out, RegWrite_out, JumpM_out, testr1out, testr2out);

    initial begin
    Clk = 0;
    forever begin
    #10 Clk = ~Clk;
    end end
    
    initial
    begin
    ALUSrc = 0;
    PC_Control = 0;
    MemWrite = 0;
    MemRead = 0;
    MemtoReg_in = 0;
    Jump_in = 0;
    RegWrite_in = 0;
    JumpM_in = 0;
    PC = 10;
    rs1 = 8;
    rs2 = 4;
    immgen = 3;
    ALUOp = 0;
    
    #100;
    
    end
endmodule
