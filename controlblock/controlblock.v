`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/02/2022 02:29:56 PM
// Design Name: 
// Module Name: controlblock
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


module controlblock(clk, opcode, ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, Branch, MemtoReg, Jump, RegWrite, JumpM);
    input clk;
    input [3:0]opcode;
    output reg ALUSrc;
    output reg [2:0] ALUOp;
    output reg MemRead;
    output reg MemWrite;
    output reg PC_Control;
    output reg  Branch;
    output reg MemtoReg;
    output reg Jump;
    output reg RegWrite;
    output reg JumpM;
    
    always@(posedge clk)
    begin
    //NOP everything should be zero
    ALUSrc = 0;
    ALUOp = 3'b000;
    MemRead = 0;
    MemWrite = 0;
    PC_Control = 0;
    Branch = 0;
    MemtoReg = 0;
    Jump = 0;
    RegWrite = 0;
    JumpM = 0;
    
    //SavePC
    if(opcode == 4'b1111)
    begin
        ALUSrc = 1;
        ALUOp = 3'b100;
        PC_Control = 1;
        MemtoReg = 1;
        Jump = 0;
        RegWrite = 1;
    end
    
    //load
    else if(opcode == 4'b1110)
    begin
    end
    
    //store
    else if(opcode == 4'b0011)
    begin
    end
    

    
    
    end
    
endmodule
