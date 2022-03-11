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


module instruction_memory(clk, address, instr);
    input clk;
    input [31:0] address;
    output reg [31:0] instr;
    
    wire[31:0] instrs [255:0];
    
    assign instrs[0] = 0;
    assign instrs[1] = 0;
    assign instrs[2] = 0;
    assign instrs[3] = 0;
    assign instrs[4] = 0;
    assign instrs[5] = 32'b01110001000001000001000000000000;//SUB x4, x4, x4
    assign instrs[6] = 32'b01000001010000100000110000000000;//ADD x5, x2, x3
    assign instrs[7] = 32'b11110010010000000000000000000001;//SVPC x9, 1
    assign instrs[8] = 32'b11100001100000100000000000000000;//LD x6, x2
    assign instrs[9] = 32'b00000000000000000000000000000000;//NOP
    assign instrs[10] = 32'b00000000000000000000000000000000;//NOP
    assign instrs[11] = 32'b00000000000000000000000000000000;//NOP
    assign instrs[12] = 32'b01000001000001000001100000000000;//ADD x4, x4, x6
    assign instrs[13] = 32'b01010000100000100000010000000000;//INC x2, x2, 1
    assign instrs[14] = 32'b00000000000000000000000000000000;//NOP
    assign instrs[15] = 32'b00000000000000000000000000000000;//NOP
    assign instrs[16] = 32'b01110010000000100001010000000000;//SUB x8, x2, x5
    assign instrs[17] = 32'b10110000000010010000000000000000;//BRN x9

    //when clk is positive read the value
    always@(posedge clk)
        begin
            instr = instrs[address];
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
    
    initial
    begin 
    data[1] = 32'h1;
    data[2] = 32'h2;
    data[3] = 32'h3;
    data[4] = 32'h4;
    data[5] = 32'h5;
    data[6] = 32'h6;
    data[7] = 32'h7;
    data[8] = 32'h8;
    data[9] = 32'h9;
    end
    
    always@(posedge clk)
        begin
            rs_out = data[rs];
            rt_out = data[rt];
            if (wrt ==1)//if write signal is high, data_in should be written to address rd
                data[rd] = data_in;        
        end
endmodule

module data_memory(clk, read, wrt, address, data_in, data_out);
    input clk, read, wrt;
    input [31:0] address;
    input [31:0] data_in;
    
    output reg[31:0] data_out;
    
    reg [31:0] data[63:0];
    
    initial begin
    data[0] = 0;
    data[1] = 1;
    data[2] = 2;
    end
    
    always@(posedge clk)
        begin
            if(wrt ==1)//if write is high, write data into the specific address input
                data[address[15:0]] = data_in;

            if(read ==1)//if read is high, read data at that address
                data_out = data[address[15:0]];
        end

endmodule
