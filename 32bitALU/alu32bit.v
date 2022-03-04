
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/19/2022 02:38:32 PM
// Design Name: 
// Module Name: ALU
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


module alu32bit(A, B, add, inc, neg, sub, out, Z, N);
    input [31:0] A;
    input [31:0] B;
    input add,inc,neg,sub;
    output [31:0] out;
    output Z, N;
    
    wire[1:0] select;
    wire[31:0] outA;
    wire[31:0] outB;
    wire[31:0] negA;
    wire[31:0] addout;
    wire carryout, nsub;
    
    not(nsub, sub);
    and(select[0], inc, nsub);
    nor(select[1], add, inc);

    twosComp negateA(A, negA);
    threeToOne muxA(A, negA, select, outA);
    twoToOne muxB(B, neg, outB);
    fullAdder full(outA, outB, carryout, out);
    
    nor(Z, out[1], out[2], out[3], out[4], out[5], out[6], out[7], out[8], out[9], out[10], out[11], out[12], out[13], out[14], out[15], out[16], out[17], out[18], out[19], out[20], out[21], out[22], out[23], out[24], out[25], out[26], out[27], out[28], out[29], out[30], out[31]);
    assign N = out[31];
    
endmodule



module twoToOne(B, sel, out);
    input [31:0] B;
    input sel;
    
    output [31:0] out;
    wire s0w;
    
    // selecting B
    not(s0w, sel);
    and(out[0], B[0], s0w);
    and(out[1], B[1], s0w);
    and(out[2], B[2], s0w);
    and(out[3], B[3], s0w);
    and(out[4], B[4], s0w);
    and(out[5], B[5], s0w);
    and(out[6], B[6], s0w);
    and(out[7], B[7], s0w);
    and(out[8], B[8], s0w);
    and(out[9], B[9], s0w);
    and(out[10], B[10], s0w);
    and(out[11], B[11], s0w);
    and(out[12], B[12], s0w);
    and(out[13], B[13], s0w);
    and(out[14], B[14], s0w);
    and(out[15], B[15], s0w);
    and(out[16], B[16], s0w);
    and(out[17], B[17], s0w);
    and(out[18], B[18], s0w);
    and(out[19], B[19], s0w);
    and(out[20], B[20], s0w);
    and(out[21], B[21], s0w);
    and(out[22], B[22], s0w);
    and(out[23], B[23], s0w);
    and(out[24], B[24], s0w);
    and(out[25], B[25], s0w);
    and(out[26], B[26], s0w);
    and(out[27], B[27], s0w);
    and(out[28], B[28], s0w);
    and(out[29], B[29], s0w);
    and(out[30], B[30], s0w);
    and(out[31], B[31], s0w);

endmodule



module threeToOne(A, negA, sel, out);
    input [31:0]A;
    input [31:0]negA;
    input [1:0]sel;
    
    output [31:0]out;
    
    wire s0w,s1w,oneout;
    wire [31:0]outA;
    wire [31:0]A_out;
    
    not(s0w,sel[0]);
    not(s1w,sel[1]);
    
    and(oneout, 1, s1w, sel[0]);
    
    and(outA[0],A[0],s0w,s1w);
    and(A_out[0],negA[0],s0w,sel[1]);
    or(out[0],outA[0],oneout,A_out[0]);
    
    and(outA[1],A[1],s0w,s1w);
    and(A_out[1],negA[1],s0w,sel[1]);
    or(out[1],outA[1],0,A_out[1]);
    
    and(outA[2],A[2],s0w,s1w);
    and(A_out[2],negA[2],s0w,sel[1]);
    or(out[2],outA[2],0,A_out[2]);
    
    and(outA[3],A[3],s0w,s1w);
    and(A_out[3],negA[3],s0w,sel[1]);
    or(out[3],outA[3],0,A_out[3]);
    
    and(outA[4],A[4],s0w,s1w);
    and(A_out[4],negA[4],s0w,sel[1]);
    or(out[4],outA[4],0,A_out[4]);
    
    and(outA[5],A[5],s0w,s1w);
    and(A_out[5],negA[5],s0w,sel[1]);
    or(out[5],outA[5],0,A_out[5]);
    
    and(outA[6],A[6],s0w,s1w);
    and(A_out[6],negA[6],s0w,sel[1]);
    or(out[6],outA[6],0,A_out[6]);
    
    and(outA[7],A[7],s0w,s1w);
    and(A_out[7],negA[7],s0w,sel[1]);
    or(out[7],outA[7],0,A_out[7]);
    
    and(outA[8],A[8],s0w,s1w);
    and(A_out[8],negA[8],s0w,sel[1]);
    or(out[8],outA[8],0,A_out[8]);
    
    and(outA[9],A[9],s0w,s1w);
    and(A_out[9],negA[9],s0w,sel[1]);
    or(out[9],outA[9],0,A_out[9]);
    
    and(outA[10],A[10],s0w,s1w);
    and(A_out[10],negA[10],s0w,sel[1]);
    or(out[10],outA[10],0,A_out[10]);
    
    and(outA[11],A[11],s0w,s1w);
    and(A_out[11],negA[11],s0w,sel[1]);
    or(out[11],outA[11],0,A_out[11]);
    
    and(outA[12],A[12],s0w,s1w);
    and(A_out[12],negA[12],s0w,sel[1]);
    or(out[12],outA[12],0,A_out[12]);
    
    and(outA[13],A[13],s0w,s1w);
    and(A_out[13],negA[13],s0w,sel[1]);
    or(out[13],outA[13],0,A_out[13]);
    
    and(outA[14],A[14],s0w,s1w);
    and(A_out[14],negA[14],s0w,sel[1]);
    or(out[14],outA[14],0,A_out[14]);
    
    and(outA[15],A[15],s0w,s1w);
    and(A_out[15],negA[15],s0w,sel[1]);
    or(out[15],outA[15],0,A_out[15]);
    
    and(outA[16],A[16],s0w,s1w);
    and(A_out[16],negA[16],s0w,sel[1]);
    or(out[16],outA[16],0,A_out[16]);
    
    and(outA[17],A[17],s0w,s1w);
    and(A_out[17],negA[17],s0w,sel[1]);
    or(out[17],outA[17],0,A_out[17]);
    
    and(outA[18],A[18],s0w,s1w);
    and(A_out[18],negA[18],s0w,sel[1]);
    or(out[18],outA[18],0,A_out[18]);
    
    and(outA[19],A[19],s0w,s1w);
    and(A_out[19],negA[19],s0w,sel[1]);
    or(out[19],outA[19],0,A_out[19]);
    
    and(outA[20],A[20],s0w,s1w);
    and(A_out[20],negA[20],s0w,sel[1]);
    or(out[20],outA[20],0,A_out[20]);
    
    and(outA[21],A[21],s0w,s1w);
    and(A_out[21],negA[21],s0w,sel[1]);
    or(out[21],outA[21],0,A_out[21]);
    
    and(outA[22],A[22],s0w,s1w);
    and(A_out[22],negA[22],s0w,sel[1]);
    or(out[22],outA[22],0,A_out[22]);
    
    and(outA[23],A[23],s0w,s1w);
    and(A_out[23],negA[23],s0w,sel[1]);
    or(out[23],outA[23],0,A_out[23]);
    
    and(outA[24],A[24],s0w,s1w);
    and(A_out[24],negA[24],s0w,sel[1]);
    or(out[24],outA[24],0,A_out[24]);
    
    and(outA[25],A[25],s0w,s1w);
    and(A_out[25],negA[25],s0w,sel[1]);
    or(out[25],outA[25],0,A_out[25]);
    
    and(outA[26],A[26],s0w,s1w);
    and(A_out[26],negA[26],s0w,sel[1]);
    or(out[26],outA[26],0,A_out[26]);
    
    and(outA[27],A[27],s0w,s1w);
    and(A_out[27],negA[27],s0w,sel[1]);
    or(out[27],outA[27],0,A_out[27]);
    
    and(outA[28],A[28],s0w,s1w);
    and(A_out[28],negA[28],s0w,sel[1]);
    or(out[28],outA[28],0,A_out[28]);
    
    and(outA[29],A[29],s0w,s1w);
    and(A_out[29],negA[29],s0w,sel[1]);
    or(out[29],outA[29],0,A_out[29]);
    
    and(outA[30],A[30],s0w,s1w);
    and(A_out[30],negA[30],s0w,sel[1]);
    or(out[30],outA[30],0,A_out[30]);
    
    and(outA[31],A[31],s0w,s1w);
    and(A_out[31],negA[31],s0w,sel[1]);
    or(out[31],outA[31],0,A_out[31]);
endmodule



module twosComp(A, out);
    input [31:0] A;
    output [31:0] out;
    wire [31:0] nA;
    wire cout;
    
    //assign out = ~A + 1;
    
    not(nA[0], A[0]);
    not(nA[1], A[1]);
    not(nA[2], A[2]);
    not(nA[3], A[3]);
    not(nA[4], A[4]);
    not(nA[5], A[5]);
    not(nA[6], A[6]);
    not(nA[7], A[7]);
    not(nA[8], A[8]);
    not(nA[9], A[9]);
    not(nA[10], A[10]);
    not(nA[11], A[11]);
    not(nA[12], A[12]);
    not(nA[13], A[13]);
    not(nA[14], A[14]);
    not(nA[15], A[15]);
    not(nA[16], A[16]);
    not(nA[17], A[17]);
    not(nA[18], A[18]);
    not(nA[19], A[19]);
    not(nA[20], A[20]);
    not(nA[21], A[21]);
    not(nA[22], A[22]);
    not(nA[23], A[23]);
    not(nA[24], A[24]);
    not(nA[25], A[25]);
    not(nA[26], A[26]);
    not(nA[27], A[27]);
    not(nA[28], A[28]);
    not(nA[29], A[29]);
    not(nA[30], A[30]);
    not(nA[31], A[31]);
    
    fullAdder full(nA, 1, cout, out);
    
endmodule



module adder(A, B, cin, out, cout);
    input A, B, cin;
    output out, cout;
    wire ab, and1, and2;
    
    xor(ab, A, B);
    xor(out, ab, cin);
    
    and(and1, cin, ab);
    and(and2, A, B);
    or(cout, and1, and2);
    
endmodule



module fullAdder(A, B, cout, sum);
    input [31:0] A;
    input [31:0] B;
    
    output [31:0]sum;
    output cout;
    wire c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, c17, c18, c19, c20, c21, c22, c23, c24, c25, c26, c27, c28, c29, c30;
    
    adder adder0(A[0], B[0], 1'b0, sum[0], c0);
    adder adder1(A[1], B[1], c0, sum[1], c1);
    adder adder2(A[2], B[2], c1, sum[2], c2);
    adder adder3(A[3], B[3], c2, sum[3], c3);
    adder adder4(A[4], B[4], c3, sum[4], c4);
    adder adder5(A[5], B[5], c4, sum[5], c5);
    adder adder6(A[6], B[6], c5, sum[6], c6);
    adder adder7(A[7], B[7], c6, sum[7], c7);
    adder adder8(A[8], B[8], c7, sum[8], c8);
    adder adder9(A[9], B[9], c8, sum[9], c9);
    adder adder10(A[10], B[10], c9, sum[10], c10);
    adder adder11(A[11], B[11], c10, sum[11], c11);
    adder adder12(A[12], B[12], c11, sum[12], c12);
    adder adder13(A[13], B[13], c12, sum[13], c13);
    adder adder14(A[14], B[14], c13, sum[14], c14);
    adder adder15(A[15], B[15], c14, sum[15], c15);
    adder adder16(A[16], B[16], c15, sum[16], c16);
    adder adder17(A[17], B[17], c16, sum[17], c17);
    adder adder18(A[18], B[18], c17, sum[18], c18);
    adder adder19(A[19], B[19], c18, sum[19], c19);
    adder adder20(A[20], B[20], c19, sum[20], c20);
    adder adder21(A[21], B[21], c20, sum[21], c21);
    adder adder22(A[22], B[22], c21, sum[22], c22);
    adder adder23(A[23], B[23], c22, sum[23], c23);
    adder adder24(A[24], B[24], c23, sum[24], c24);
    adder adder25(A[25], B[25], c24, sum[25], c25);
    adder adder26(A[26], B[26], c25, sum[26], c26);
    adder adder27(A[27], B[27], c26, sum[27], c27);
    adder adder28(A[28], B[28], c27, sum[28], c28);
    adder adder29(A[29], B[29], c28, sum[29], c29);
    adder adder30(A[30], B[30], c29, sum[30], c30);
    adder adder31(A[31], B[31], c30, sum[31], cout);

endmodule
