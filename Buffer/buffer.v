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
    input [31:0] PC_in;
    input [21:0] inst_mem;
    input clk;
    output reg [31:0] PC_out;
    output reg [21:0] inst_out;
    
    always@(posedge clk)
        begin
             PC_out = PC_in;
             inst_out = inst_mem;
        end
    
endmodule

//This is the buffer for ID to EX
module ID_EX(clk, PC_in, data1, data2, imm_in, PC_out, reg1, reg2, imm_out);
    input [31:0] PC_in;
    input [31:0] data1;
    input [31:0] data2;
    input [31:0] imm_in;
    input clk;
    output reg [31:0] PC_out;
    output reg [31:0] reg1;
    output reg [31:0] reg2;
    output reg [31:0] imm_out;
    
    always@(posedge clk)
        begin
             PC_out = PC_in;
             reg1 = data1;
             reg2 = data2;
             imm_out = imm_in;
        end
endmodule 

//This is the buffer for EX to MEM
module EX_MEM (clk, PC_const_in, Zero_in, ALU_in, reg2_in, PC_out, Zero_out, ALU_out, reg2_out);
    input [31:0] PC_const_in;
    input [31:0] Zero_in;
    input [31:0] ALU_in;
    input [31:0] reg2_in;
    input clk;
    output reg [31:0] PC_out;
    output reg [31:0] Zero_out;
    output reg [31:0] ALU_out;
    output reg [31:0] reg2_out;
    
    always@(posedge clk)
        begin
             PC_out = PC_const_in;
             Zero_out = Zero_in;
             reg2_out = reg2_in;
             ALU_out = ALU_in;
        end
endmodule 

//This is the buffer for MEM to WB
module MEM_WB (clk, data_mem_in, ALU_result_in, ALU_result, data_mem_out);
    input [31:0] data_mem_in;
    input [31:0] ALU_result_in;
    input clk;
    
    output reg [31:0] ALU_result;
    output reg [31:0] data_mem_out;
    
    always@(posedge clk)
        begin
            ALU_result = ALU_result_in;
            data_mem_out = data_mem_in;
        end
        
endmodule

    
