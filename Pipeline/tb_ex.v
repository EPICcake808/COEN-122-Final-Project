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


module tb_ex();
  reg clk;
  reg [31:0] PC;
  reg [31:0] rs1;
  reg [31:0] rs2;
  reg [31:0] immgen;
  reg ALUSrc;
  reg ALUOp;
  reg PC_Control;
  reg MemWrite;
  reg MemRead;
  reg add;
  reg inc;
  reg neg;
  reg sub;
  
  wire Zero;
  wire Neg;
  wire [31:0] ALU_result;
  wire [31:0] read_data;
  
  initial
    begin
        clk = 0;
        forever #5 clk = ~clk;
    end
  
  initial
    begin
      //add
      PC = 4;
      rs1 = 23;
      rs2 = 5;
      ALUSrc = 0;
      ALUOp = 4'b100;
      PC_Control = 0;
      MemWrite = 0;
      MemRead = 0;
      
      ALU alu(rs1, rs2, add, inc, neg, sub, ALU_result, Zero, Neg);
      //alu result = 23+5 = 28
      #50
      
      //load
      MemRead = 1;
      rs1 = 5;
      rs2 = 18;
      
      data_memory test(clk, MemRead, MemWrite, rs1, rs2, read_data);
      //rs1 = mem[rs2]
      //don't know what data at those memory locations is??
      
      #50
    end
  
endmodule
