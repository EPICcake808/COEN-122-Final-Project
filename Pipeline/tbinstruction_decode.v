`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2022 08:28:16 PM
// Design Name: 
// Module Name: tbinstruction_decode
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


module tbinstruction_decode();
    reg [31:0] instr_in;
    reg [31:0] data_in;
    reg [31:0] PC;
    reg RegWrite;
    reg Clk;
    reg Zero, Neg;
    wire ALUSrc, MemRead, MemWrite, PC_Control, MemtoReg, Jump, JumpM;
    
    wire [2:0] ALUOp;
    wire [31:0] PC_out;
    wire [31:0] rs_out;
    wire [31:0] rt_out;
    wire [31:0] imm_out;
    wire branch_out;
    
    id test(Clk, instr_in, data_in, PC, branch_out, PC_out, rs_out, rt_out, imm_out, ALUSrc, MemRead, MemWrite, PC_Control, MemtoReg, Jump, RegWrite, JumpM, Zero, Neg, ALUOp);    
    initial begin
    Clk = 0;
    forever begin
    #10 Clk = ~Clk;
    end end
    
    initial
    begin
    PC = 0;
    instr_in = 0;
    data_in = 0;
    RegWrite = 0;
    Zero = 0;
    Neg = 0;
    
    #100;
    
    instr_in = 32'b00000000001000000000000000000000;
    
    #100;
    
    instr_in = 32'b10010000000000000000000000000000;
    Zero = 1;
    
    #100;
    end
endmodule
