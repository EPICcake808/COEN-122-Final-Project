`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Ian Ohari
// 
// Create Date: 01/25/2022 02:59:30 PM
// Design Name: 8 Bit ALU
// Module Name: alu
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
//Do we need to pass in WB controls? I did not
module EX_M(clk, PC, rs1, rs2, immgen, ALUSrc, ALUOp, PC_Control, MemWrite, MemRead, Zero, Neg, ALU_result, read_data);
  input clk;
  input [31:0] PC;
  input [31:0] rs1;
  input [31:0] rs2;
  input [31:0] immgen;
  input ALUSrc;
  input ALUOp;
  input PC_Control;
  input MemWrite;
  input MemRead;
  
  //delete inc from ALU???
  wire [31:0] input1;
  wire [31:0] input2;
  wire add;
  wire inc;
  wire neg;
  wire sub;
  
  output reg Zero;
  output reg Neg;
  output reg [31:0] ALU_result;
  output reg [31:0] read_data;
  
  
  //mux(out, 1, 0, control)
  mux21 m1(input1, PC, rs1, PC_Control);
  mux21 m2(input2, immgen, rs2, ALUSrc);
  
  
  
  add = 0;
  inc = 0;
  neg = 0;
  sub = 0;
  if(ALUOp == 3'b100)
    begin
      add = 1;    
    end
  else if(ALUOp == 3'b010)
    begin
      neg = 1;
    end
  else if(ALUOp == 3'b001)
    begin
      sub = 1;
    end
  if(ALUOp == 3'b111)
    begin
      add = 1;
      sub = 1;
      neg = 1;
    end
   
  ALU alu(input1, input2, add, inc, neg, sub, ALU_result, Zero, Neg);
  
  data_memory dm(clk, MemRead, MemWrite, rs1, rs2, read_data);
  
endmodule
  
  
  

  
