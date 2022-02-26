`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Samantha Yanovsky
// 
// Create Date: 01/26/2022 02:30:44 PM
// Design Name: 
// Module Name: logicblock
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


module instruction_memory(clk, address, instruction);
    input clk;
    input [7:0] address;
    output reg [31:0] instruction;
    
    wire[31:0] instrs [255:0];
    
    assign instrs[0] = 16;//hardcode values

    //when clk is positive read the value
    always@(posedge clk)
        begin
            instruction = instrs[address];
        end

endmodule

module register_file(clk, wrt, rd, rs, rt, data_in, rs_out, rt_out);
    input clk, wrt;
    input [5:0] rd;
    input [5:0] rs;
    input [5:0] rt;
    input [31:0] data_in;
    
    output reg[31:0] rs_out;
    output reg[31:0] rt_out;
    
    reg[31:0] data[63:0];
    
    always@(posedge clk)
        begin
            if (wrt ==1)//if write signal is high, data_in should be written to address rd
                data[rd] = data_in;
                rs_out = data[rs];
                rt_out = data[rt];        
        end
endmodule

module data_memory(clk, read, wrt, address, data_in, data_out);
    input clk, read, wrt;
    input [31:0] address;
    input [31:0] data_in;
    
    output reg[31:0] data_out;
    
    reg [31:0] data[65535:0];
    
    always@(posedge clk)
        begin
            if(wrt ==1)//if write is high, write data into the specific address input
                data[address[15:0]] = data_in;

            if(read ==1)//if read is high, read data at that address
                data_out = data[address[15:0]];
        end

endmodule
