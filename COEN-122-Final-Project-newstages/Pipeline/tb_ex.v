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
  ALU test1(rs1, rs2, add, inc, neg, sub, ALU_result, Zero, Neg);
  data_memory test2(clk, MemRead, MemWrite, rs1, rs2, read_data);
 
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
      
      //ALU test(rs1, rs2, add, inc, neg, sub, ALU_result, Zero, Neg);
      //alu result = 23+5 = 28
      #50
      
      //store
      MemWrite = 1;
      rs1 = 18;
      rs2 = 5;
      //data_memory test(clk, MemRead, MemWrite, rs1, rs2, read_data);
      //storing Mem[x5] = 18
      #50
      
      //load
      MemRead = 1;
      MemWrite = 0;
      rs1 = 18;
      rs2 = 5;
      
      //data_memory test(clk, MemRead, MemWrite, rs1, rs2, read_data);
      // read_data = mem[rs2]
      //so read_data should be 18
      
      #50
      $finish;
    end
  
endmodule
