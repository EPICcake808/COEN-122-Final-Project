`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2022 06:56:56 PM
// Design Name: 
// Module Name: tbinstruction_fetch
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


module tbinstruction_fetch();
    reg [31:0] ALU_result;
    reg [31:0] read_data;
    reg [31:0] rs1;
    reg Jump, JumpM, Branch, Clk;
    
    wire [31:0] instr_out;

    instruction_fetch test(Clk, ALU_result, read_data, rs1, Jump, JumpM, Branch, instr_out);
    
    initial begin
    Clk = 0;
    forever begin
    #10 Clk = ~Clk;
    end end
    
    initial
    begin
    ALU_result = 0;
    read_data = 0;
    rs1 = 0;
    Jump = 0;
    JumpM = 0;
    Branch = 0;
    
    #100;
    
    
    
    end
endmodule
