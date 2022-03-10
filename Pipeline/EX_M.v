
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
module EX_M(clk, PC, rs1, rs2, immgen, ALUSrc, ALUOp, PC_Control, MemRead, MemWrite, MemtoReg_in, Jump_in, RegWrite_in, JumpM_in, ALU_result, Zero, Neg_out, read_data, MemtoReg_out, Jump_out, RegWrite_out, JumpM_out);
  input clk;
  input [31:0] PC;
  input [15:0] rs1;
  input [31:0] rs2;
  input [31:0] immgen;
  input ALUSrc;
  input [2:0] ALUOp;
  input PC_Control;
  input MemWrite;
  input MemRead;
  input MemtoReg_in;
  input Jump_in;
  input RegWrite_in;
  input JumpM_in;

  
  //delete inc from ALU???  <=  Yes, actually I don't think the ALU takes an increment control
  wire [31:0] input1;
  wire [31:0] input2;
  output [31:0] ALU_result;
  output [31:0] read_data;
  
  output Zero;
  output Neg_out;
  output MemtoReg_out;
  output Jump_out;
  output RegWrite_out;
  output JumpM_out;

  
  reg add;
  reg inc;
  reg neg;
  reg sub;
 
//IMPORTANT  
//No outputs here because synthesis didn't like it
//For the top level CPU file gonna have to copy paste the code and use lots of wires
  
  //mux(out, 1, 0, control)
  mux21_32bit m1(input1, rs1, PC, PC_Control);
  mux21_32bit m2(input2, rs2, immgen, ALUSrc);
  
  

//  assign add = 0;
//  assign inc = 0;
//  assign neg = 0;
//  assign sub = 0;

//  if(ALUOp == 3'b100)
//    begin
//      assign add = 1;    
//    end
//  else if(ALUOp == 3'b010)
//    begin
//      assign neg = 1;
//    end
//  else if(ALUOp == 3'b001)
//    begin
//      assign sub = 1;
//    end
//  if(ALUOp == 3'b111)
//   begin
//      assign add = 1;
//      assign sub = 1;
//      assign neg = 1;
//    end


//IMPORTANT
//I had to set the ALUOp "controls" to reg types because continuous assignment doesn't work without a control block
//Even if we had a control block for the ALUOp, it still wouldn't be continuous assignment because it would run off the Clk

    always @(posedge clk)
    begin
        case(ALUOp)
        3'b100: begin
                    add = 1;
                    inc = 0;
                    neg = 0;
                    sub = 0;
                end
        3'b010: begin
                    add = 0;
                    inc = 0;
                    neg = 1;
                    sub = 0;
                end
        3'b001: begin
                    add = 0;
                    inc = 0;
                    sub = 1;
                    neg = 0;
                end
        3'b111: begin
                    add = 1;
                    inc = 0;
                    neg = 1;
                    sub = 1;
                end
        3'b000: begin
                    add = 1;
                    inc = 0;
                    neg = 1;
                    sub = 1;
                end
        endcase
    end
       
  alu32bit alu1(input1, input2, add, inc, neg, sub, ALU_result, Zero, Neg_out);
  
  data_memory dm(clk, MemRead, MemWrite, rs1[15:0], rs2, read_data);
  
    assign MemtoReg_out =  MemtoReg_in;
    assign Jump_out =  Jump_in;
    assign RegWrite_out =  RegWrite_in;
    assign JumpM_out =  JumpM_in;

  
endmodule
