`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Samantha Yanovsky
// 
// Create Date: 01/19/2022 02:36:28 PM
// Design Name: 
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


module alu(A, B, add, inc, neg, sub, out, Z, N);
    input [31:0] A;
    input [31:0] B;
    input add, inc, neg, sub;
    output [31:0] out;
    output Z, N;
    
    wire [1:0] select;
    wire [31:0] negA;
    wire [31:0] output_A;
    wire [31:0] output_B;
    wire not_sub, cout;
    
    //generate selects for 3:1 mux
    not(not_sub, sub);
    and(select[0], inc, not_sub);
    nor(select[1], add, inc);
    
    negate neg_A(A, negA);
    three_to_one muxA(A, negA, select, output_A);
    
    two_to_one muxB(B, neg, output_B);
    
    full_adder add_mux(output_A, output_B, cout, out);
    
    //Z flag
    nor(Z, out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7], out[8], out[9], out[10], 
        out[11], out[12], out[13], out[14], out[15], out[16], out[17], out[18], out[19], out[20], 
        out[21], out[22], out[23], out[24], out[25], out[26], out[27], out[28], out[29], out[30], out[31]);
    
    //N flag
    assign N = out[31];
    
    
    
    
    
endmodule

module two_to_one(B, sel, out);

    input [31:0] B;
    input sel;
    output [31:0] out; 
    
    wire not_sel;
    wire [31:0] out_1;
    wire [31:0] out_2;
    

    //as shown in the schematic the not select is ANDed with B
    not(not_sel, sel);
    and(out_1[0], B[0], not_sel);
    and(out_1[1], B[1], not_sel);
    and(out_1[2], B[2], not_sel);
    and(out_1[3], B[3], not_sel);
    and(out_1[4], B[4], not_sel);
    and(out_1[5], B[5], not_sel);
    and(out_1[6], B[6], not_sel);
    and(out_1[7], B[7], not_sel);
    and(out_1[8], B[8], not_sel);
    and(out_1[9], B[9], not_sel);
    and(out_1[10], B[10], not_sel);
    and(out_1[11], B[11], not_sel);
    and(out_1[12], B[12], not_sel);
    and(out_1[13], B[13], not_sel);
    and(out_1[14], B[14], not_sel);
    and(out_1[15], B[15], not_sel);
    and(out_1[16], B[16], not_sel);
    and(out_1[17], B[17], not_sel);
    and(out_1[18], B[18], not_sel);
    and(out_1[19], B[19], not_sel);
    and(out_1[20], B[20], not_sel);
    and(out_1[21], B[21], not_sel);
    and(out_1[22], B[22], not_sel);
    and(out_1[23], B[23], not_sel);
    and(out_1[24], B[24], not_sel);
    and(out_1[25], B[25], not_sel);
    and(out_1[26], B[26], not_sel);
    and(out_1[27], B[27], not_sel);
    and(out_1[28], B[28], not_sel);
    and(out_1[29], B[29], not_sel);
    and(out_1[30], B[30], not_sel);
    and(out_1[31], B[31], not_sel);
  
    
    //as shown in the schematic the sec is ANDed with 0
    and(out_2[0], 0, sel);
    and(out_2[1], 0, sel);
    and(out_2[2], 0, sel);
    and(out_2[3], 0, sel);
    and(out_2[4], 0, sel);
    and(out_2[5], 0, sel);
    and(out_2[6], 0, sel);
    and(out_2[7], 0, sel);
    and(out_2[8], 0, sel);
    and(out_2[9], 0, sel);
    and(out_2[10], 0, sel);
    and(out_2[11], 0, sel);
    and(out_2[12], 0, sel);
    and(out_2[13],0, sel);
    and(out_2[14], 0, sel);
    and(out_2[15], 0, sel);
    and(out_2[16], 0, sel);
    and(out_2[17], 0, sel);
    and(out_2[18], 0, sel);
    and(out_2[19], 0, sel);
    and(out_2[20], 0, sel);
    and(out_2[21], 0, sel);
    and(out_2[22], 0, sel);
    and(out_2[23], 0, sel);
    and(out_2[24], 0, sel);
    and(out_2[25], 0, sel);
    and(out_2[26], 0, sel);
    and(out_2[27], 0, sel);
    and(out_2[28], 0, sel);
    and(out_2[29], 0, sel);
    and(out_2[30], 0, sel);
    and(out_2[31], 0, sel); 
 
    //as shown in the schematic the two outputs of the ANDs are ORed together to get the output   
    or(out[0], out_1[0], out_2[0]);
    or(out[1], out_1[1], out_2[1]);
    or(out[2], out_1[2], out_2[2]);
    or(out[3], out_1[3], out_2[3]);
    or(out[4], out_1[4], out_2[4]);
    or(out[5], out_1[5], out_2[5]);
    or(out[6], out_1[6], out_2[6]);
    or(out[7], out_1[7], out_2[7]);
    or(out[8], out_1[8], out_2[8]);
    or(out[9], out_1[9], out_2[9]);
    or(out[10], out_1[10], out_2[10]);
    or(out[11], out_1[11], out_2[11]);
    or(out[12], out_1[12], out_2[12]);
    or(out[13], out_1[13], out_2[13]);
    or(out[14], out_1[14], out_2[14]);
    or(out[15], out_1[15], out_2[15]);
    or(out[16], out_1[16], out_2[16]);
    or(out[17], out_1[17], out_2[17]);
    or(out[18], out_1[18], out_2[18]);
    or(out[19], out_1[19], out_2[19]);
    or(out[20], out_1[20], out_2[20]);
    or(out[21], out_1[21], out_2[21]);
    or(out[22], out_1[22], out_2[22]);
    or(out[23], out_1[23], out_2[23]);
    or(out[24], out_1[24], out_2[24]);
    or(out[25], out_1[25], out_2[25]);
    or(out[26], out_1[26], out_2[26]);
    or(out[27], out_1[27], out_2[27]);
    or(out[28], out_1[28], out_2[28]);
    or(out[29], out_1[29], out_2[29]);
    or(out[30], out_1[30], out_2[30]);
    or(out[31], out_1[31], out_2[31]);
    

endmodule


module one_bit_adder(A, B, cin, cout, out);
    input A, B, cin, cout;
    output out;
    
    //if you look at the truth table for a one bit adder, you realize that A XOR B XOR C is the output 
    //and (A AND B) OR (B AND cin) OR (A AND cin) will get you the cost
    assign out = A ^ B ^ cin;
    assign cout = (A & B) | (B & cin) | (A & cin);

endmodule


module full_adder(A, B, cout, sum);
    input [31:0] A;
    input [31:0] B;  
    output [31:0] sum;
    output cout;
    
    wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30;
    
    //use the one bit adder 32 times to get a full adder for 32 bits
    //In the first one bit adder the cin is 0
    one_bit_adder addr0(A[0], B[0], 0, c0, sum[0]);
    one_bit_adder addr1(A[1], B[1], c0, c1, sum[1]);
    one_bit_adder addr2(A[2], B[2], c1, c2, sum[2]);
    one_bit_adder addr3(A[3], B[3], c2, c3, sum[3]);
    one_bit_adder addr4(A[4], B[4], c3, c4, sum[4]);
    one_bit_adder addr5(A[5], B[5], c4, c5, sum[5]);
    one_bit_adder addr6(A[6], B[6], c5, c6, sum[6]);
    one_bit_adder addr7(A[7], B[7], c6, c7, sum[7]);
    one_bit_adder addr8(A[8], B[8], c7, c8, sum[8]);
    one_bit_adder addr9(A[9], B[9], c8, c9, sum[9]);
    one_bit_adder addr10(A[10], B[10], c9, c10, sum[10]);
    one_bit_adder addr11(A[11], B[11], c10, c11, sum[11]);
    one_bit_adder addr12(A[12], B[12], c11, c12, sum[12]);
    one_bit_adder addr13(A[13], B[13], c12, c13, sum[13]);
    one_bit_adder addr14(A[14], B[14], c13, c14, sum[14]);
    one_bit_adder addr15(A[15], B[15], c14, c15, sum[15]);
    one_bit_adder addr16(A[16], B[16], c15, c16, sum[16]);
    one_bit_adder addr17(A[17], B[17], c16, c17, sum[17]);
    one_bit_adder addr18(A[18], B[18], c17, c18, sum[18]);
    one_bit_adder addr19(A[19], B[19], c18, c19, sum[19]);
    one_bit_adder addr20(A[20], B[20], c19, c20, sum[20]);
    one_bit_adder addr21(A[21], B[21], c20, c21, sum[21]);
    one_bit_adder addr22(A[22], B[22], c21, c22, sum[22]);
    one_bit_adder addr23(A[23], B[23], c22, c23, sum[23]);
    one_bit_adder addr24(A[24], B[24], c23, c24, sum[24]);
    one_bit_adder addr25(A[25], B[25], c24, c25, sum[25]);
    one_bit_adder addr26(A[26], B[26], c25, c26, sum[26]);
    one_bit_adder addr27(A[27], B[27], c26, c27, sum[27]);
    one_bit_adder addr28(A[28], B[28], c27, c28, sum[28]);
    one_bit_adder addr29(A[29], B[29], c28, c29, sum[29]);
    one_bit_adder addr30(A[30], B[30], c29, c30, sum[30]);
    one_bit_adder addr31(A[31], B[31], c30, cout, sum[31]);
    
endmodule

module negate(A, out);
    input [31:0] A;
    output [31:0] out;
    
    wire [31:0] negA;
    wire cout;
    
    
    //for two's complement, you need to negate every bit and then add 1 to the new number using full adder
    not(negA[0], A[0]);
    not(negA[1], A[1]);
    not(negA[2], A[2]);
    not(negA[3], A[3]);
    not(negA[4], A[4]);
    not(negA[5], A[5]);
    not(negA[6], A[6]);
    not(negA[7], A[7]);
    not(negA[8], A[8]);
    not(negA[9], A[9]);
    not(negA[10], A[10]);
    not(negA[11], A[11]);
    not(negA[12], A[12]);
    not(negA[13], A[13]);
    not(negA[14], A[14]);
    not(negA[15], A[15]);
    not(negA[16], A[16]);
    not(negA[17], A[17]);
    not(negA[18], A[18]);
    not(negA[19], A[19]);
    not(negA[20], A[20]);
    not(negA[21], A[21]);
    not(negA[22], A[22]);
    not(negA[23], A[23]);
    not(negA[24], A[24]);
    not(negA[25], A[25]);
    not(negA[26], A[26]);
    not(negA[27], A[27]);
    not(negA[28], A[28]);
    not(negA[29], A[29]);
    not(negA[30], A[30]);
    not(negA[31], A[31]);
    full_adder addr0(negA, 1, cout, out);

endmodule

module three_to_one(A, negA, sel, out);
    input [31:0] A;
    input [31:0] negA;
    input [1:0] sel;
    output [31:0] out;
    
        
    wire not_s0;
    wire not_s1;
    wire [31:0] out_1;
    wire [31:0] out_2;
    wire [31:0] out_3;
    
    //using the schematic, A is ANDed with the not select[0] and not select[1]
    not(not_s0, sel[0]);
    not(not_s1, sel[1]);
    and(out_1[0], A[0], not_s0, not_s1);
    and(out_1[1], A[1], not_s0, not_s1);
    and(out_1[2], A[2], not_s0, not_s1);
    and(out_1[3], A[3], not_s0, not_s1);
    and(out_1[4], A[4], not_s0, not_s1);
    and(out_1[5], A[5], not_s0, not_s1);
    and(out_1[6], A[6], not_s0, not_s1);
    and(out_1[7], A[7], not_s0, not_s1);
    and(out_1[8], A[8], not_s0, not_s1);
    and(out_1[9], A[9], not_s0, not_s1);
    and(out_1[10], A[10], not_s0, not_s1);
    and(out_1[11], A[11], not_s0, not_s1);
    and(out_1[12], A[12], not_s0, not_s1);
    and(out_1[13], A[13], not_s0, not_s1);
    and(out_1[14], A[14], not_s0, not_s1);
    and(out_1[15], A[15], not_s0, not_s1);
    and(out_1[16], A[16], not_s0, not_s1);
    and(out_1[17], A[17], not_s0, not_s1);
    and(out_1[18], A[18], not_s0, not_s1);
    and(out_1[19], A[19], not_s0, not_s1);
    and(out_1[20], A[20], not_s0, not_s1);
    and(out_1[21], A[21], not_s0, not_s1);
    and(out_1[22], A[22], not_s0, not_s1);
    and(out_1[23], A[23], not_s0, not_s1);
    and(out_1[24], A[24], not_s0, not_s1);
    and(out_1[25], A[25], not_s0, not_s1);
    and(out_1[26], A[26], not_s0, not_s1);
    and(out_1[27], A[27], not_s0, not_s1);
    and(out_1[28], A[28], not_s0, not_s1);
    and(out_1[29], A[29], not_s0, not_s1);
    and(out_1[30], A[30], not_s0, not_s1);
    and(out_1[31], A[31], not_s0, not_s1);


    //using the schematic, 1 is ANDed with the select[0] and not select[1]  
    and(out_2[0], 1, not_s1, sel[0]);
    and(out_2[1], 1, sel);
    and(out_2[2], 1, not_s1, sel[0]);
    and(out_2[3], 1, not_s1, sel[0]);
    and(out_2[4], 1, not_s1, sel[0]);
    and(out_2[5], 1, not_s1, sel[0]);
    and(out_2[6], 1, not_s1, sel[0]);
    and(out_2[7], 1, not_s1, sel[0]);
    and(out_2[8], 1, not_s1, sel[0]);
    and(out_2[9], 1, not_s1, sel[0]);
    and(out_2[10], 1, not_s1, sel[0]);
    and(out_2[11], 1, not_s1, sel[0]);
    and(out_2[12], 1, not_s1, sel[0]);
    and(out_2[13], 1, not_s1, sel[0]);
    and(out_2[14],  1, not_s1, sel[0]);
    and(out_2[15],  1, not_s1, sel[0]);
    and(out_2[16],  1, not_s1, sel[0]);
    and(out_2[17],  1, not_s1, sel[0]);
    and(out_2[18],  1, not_s1, sel[0]);
    and(out_2[19], 1, not_s1, sel[0]);
    and(out_2[20], 1, not_s1, sel[0]);
    and(out_2[21], 1, not_s1, sel[0]);
    and(out_2[22], 1, not_s1, sel[0]);
    and(out_2[23], 1, not_s1, sel[0]);
    and(out_2[24],  1, not_s1, sel[0]);
    and(out_2[25], 1, not_s1, sel[0]);
    and(out_2[26], 1, not_s1, sel[0]);
    and(out_2[27], 1, not_s1, sel[0]);
    and(out_2[28], 1, not_s1, sel[0]);
    and(out_2[29], 1, not_s1, sel[0]);
    and(out_2[30], 1, not_s1, sel[0]);
    and(out_2[31], 1, not_s1, sel[0]);
   
    //using the schematic, the two's complement of A is ANDed with the not select[0] and select[1]
    and(out_3[0], negA[0], not_s0, sel[1]);
    and(out_3[1], negA[1], not_s0, sel[1]);
    and(out_3[2], negA[2], not_s0, sel[1]);
    and(out_3[3], negA[3], not_s0, sel[1]);
    and(out_3[4], negA[4], not_s0, sel[1]);
    and(out_3[5], negA[5], not_s0, sel[1]);
    and(out_3[6], negA[6], not_s0, sel[1]);
    and(out_3[7], negA[7], not_s0, sel[1]);
    and(out_3[8], negA[8], not_s0, sel[1]);
    and(out_3[9], negA[9], not_s0, sel[1]);
    and(out_3[10], negA[10], not_s0, sel[1]);
    and(out_3[11], negA[11], not_s0, sel[1]);
    and(out_3[12], negA[12], not_s0, sel[1]);
    and(out_3[13], negA[13], not_s0, sel[1]);
    and(out_3[14], negA[14], not_s0, sel[1]);
    and(out_3[15], negA[15], not_s0, sel[1]);
    and(out_3[16], negA[16], not_s0, sel[1]);
    and(out_3[17], negA[17], not_s0, sel[1]);
    and(out_3[18], negA[18], not_s0, sel[1]);
    and(out_3[19], negA[19], not_s0, sel[1]);
    and(out_3[20], negA[20], not_s0, sel[1]);
    and(out_3[21], negA[21], not_s0, sel[1]);
    and(out_3[22], negA[22], not_s0, sel[1]);
    and(out_3[23], negA[23], not_s0, sel[1]);
    and(out_3[24], negA[24], not_s0, sel[1]);
    and(out_3[25], negA[25], not_s0, sel[1]);
    and(out_3[26], negA[26], not_s0, sel[1]);
    and(out_3[27], negA[27], not_s0, sel[1]);
    and(out_3[28], negA[28], not_s0, sel[1]);
    and(out_3[29], negA[29], not_s0, sel[1]);
    and(out_3[30], negA[30], not_s0, sel[1]);
    and(out_3[31], negA[31], not_s0, sel[1]); 
   
    //using the schematic, the output of the ANDs are ORed together to get the output
    or(out[0], out_1[0], out_2[0], out_3[0]);
    or(out[1], out_1[1], out_2[1], out_3[1]);
    or(out[2], out_1[2], out_2[2], out_3[2]);
    or(out[3], out_1[3], out_2[3], out_3[3]);
    or(out[4], out_1[4], out_2[4], out_3[4]);
    or(out[5], out_1[5], out_2[5], out_3[5]);
    or(out[6], out_1[6], out_2[6], out_3[6]);
    or(out[7], out_1[7], out_2[7], out_3[7]);
    or(out[8], out_1[8], out_2[8], out_3[8]);
    or(out[9], out_1[9], out_2[9], out_3[9]);
    or(out[10], out_1[10], out_2[10], out_3[10]);
    or(out[11], out_1[11], out_2[11], out_3[11]);
    or(out[12], out_1[12], out_2[12], out_3[12]);
    or(out[13], out_1[13], out_2[13], out_3[13]);
    or(out[14], out_1[14], out_2[14], out_3[14]);
    or(out[15], out_1[15], out_2[15], out_3[15]);
    or(out[16], out_1[16], out_2[16], out_3[16]);
    or(out[17], out_1[17], out_2[17], out_3[17]);
    or(out[18], out_1[18], out_2[18], out_3[18]);
    or(out[19], out_1[19], out_2[19], out_3[19]);
    or(out[20], out_1[20], out_2[20], out_3[20]);
    or(out[21], out_1[21], out_2[21], out_3[21]);
    or(out[22], out_1[22], out_2[22], out_3[22]);
    or(out[23], out_1[23], out_2[23], out_3[23]);
    or(out[24], out_1[24], out_2[24], out_3[24]);
    or(out[25], out_1[25], out_2[25], out_3[25]);
    or(out[26], out_1[26], out_2[26], out_3[26]);
    or(out[27], out_1[27], out_2[27], out_3[27]);
    or(out[28], out_1[28], out_2[28], out_3[28]);
    or(out[29], out_1[29], out_2[29], out_3[29]);
    or(out[30], out_1[30], out_2[30], out_3[30]);
    or(out[31], out_1[31], out_2[31], out_3[31]);
 
endmodule