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


module controlblock(clk, opcode, ALUSrc, ALUOp, MemRead, MemWrite, PC_Control, BranchN, BranchZ, MemtoReg, Jump, RegWrite, JumpM);
    input clk;
    input [3:0]opcode;
    output reg ALUSrc;
    output reg [2:0] ALUOp;
    output reg MemRead;
    output reg MemWrite;
    output reg PC_Control;
    output reg BranchN;
    output reg BranchZ;
    output reg MemtoReg;
    output reg Jump;
    output reg RegWrite;
    output reg JumpM;
    
    always@(negedge clk)
    begin
    //NOP everything should be zero
    ALUSrc = 0;
    ALUOp = 3'b000;
    MemRead = 0;
    MemWrite = 0;
    PC_Control = 0;
    BranchN = 0;
    BranchZ= 0;
    MemtoReg = 0;
    Jump = 0;
    RegWrite = 0;
    JumpM = 0;
    
    //SavePC
    if(opcode == 4'b1111)
    begin
        ALUSrc = 1;
        ALUOp = 3'b100;
        MemWrite = 0;
        PC_Control = 1;
        BranchZ = 0;
        BranchN = 0;
        MemtoReg = 0;
        Jump = 0;
        RegWrite = 1;
        JumpM = 0;
    end
    
    //load
    else if(opcode == 4'b1110)
    begin
        ALUOp = 3'b000;
        MemRead = 1;
        MemWrite = 0;
        BranchN = 0;
        BranchZ = 0;
        MemtoReg = 1;
        Jump = 0;
        RegWrite = 1;
        JumpM = 0;
    end
    
    //store
    else if(opcode == 4'b0011)
    begin
        ALUOp = 3'b000;
        MemRead = 0;
        MemWrite = 1;
        BranchN = 0;
        BranchZ = 0;
        Jump = 0;
        RegWrite = 0;
        JumpM = 0;
    end
    
    //add
    else if(opcode == 4'b0100)
    begin
        ALUSrc = 0;
        ALUOp = 3'b100;
        MemWrite = 0;
        PC_Control = 0;
        BranchN = 0;
        BranchZ = 0;
        MemtoReg = 0;
        Jump = 0;
        RegWrite = 1;
        JumpM = 0;
    end
    
    //increment
    else if(opcode == 4'b0101)
    begin
        ALUSrc = 1;
        ALUOp = 3'b100;
        MemWrite = 0;
        PC_Control = 0;
        BranchN = 0;
        BranchZ = 0;
        MemtoReg = 0;
        Jump = 0;
        RegWrite = 1;
        JumpM = 0;
    end
    
    //negate
    else if(opcode == 4'b0110)
    begin
        ALUOp = 3'b010;
        MemWrite = 0;
        PC_Control = 0;
        BranchN = 0;
        BranchZ = 0;
        MemtoReg = 0;
        Jump = 0;
        RegWrite = 1;
        JumpM = 0;
    end
    
    //subtract
    else if(opcode == 4'b0111)
    begin
        ALUSrc = 0;
        ALUOp = 3'b001;
        MemWrite = 0;
        PC_Control = 0;
        BranchN = 0;
        BranchZ= 0;
        MemtoReg = 0;
        Jump = 0;
        RegWrite = 1;
        JumpM = 0;
    end
    
    //jump
    else if(opcode == 4'b1000)
    begin
        ALUOp = 3'b111;
        MemWrite = 0;
        PC_Control = 0;
        BranchN = 0;
        BranchZ= 0;
        Jump = 1;
        RegWrite = 0;
        JumpM = 0;
    end
    
    // branch if Z
    else if(opcode == 4'b1001)
    begin
        ALUOp = 3'b000;
        MemWrite = 0;
        BranchZ = 1;
        BranchN = 0;
        RegWrite = 0;
        JumpM = 0;
    end
    
    // jump memory
    else if(opcode == 4'b1010)
    begin
        ALUOp = 3'b000;
        MemRead = 1;
        MemWrite = 0;
        BranchN = 0;
        BranchZ = 0;
        RegWrite = 0;
        JumpM = 1;
    end
    
    // branch if N
    else if(opcode == 4'b1011)
    begin
        ALUOp = 3'b000;
        MemWrite = 0;
        BranchN = 1;
        BranchZ = 0;
        RegWrite = 0;
        JumpM = 0;
    end
    
    end
    
endmodule
