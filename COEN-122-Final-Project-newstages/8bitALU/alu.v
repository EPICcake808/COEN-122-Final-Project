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


module alu(
    input [7:0] A,
    input [7:0] B,
    input add,
    input inc,
    input neg,
    input sub,
    output [7:0] Out,
    output Z,
    output N
    );
    wire [1:0] sel;
    wire [7:0] outA;
    wire [7:0] outB;
    wire [7:0] negA;
    wire [7:0] outAdd;
    wire carryout, nsub;
    
    not (nsub, sub);
    and(sel[0], inc, nsub);
    nor(sel[1], add, inc);
    
    comp2 minusA(negA, A);
    mux318bit m31(outA, A, negA, sel);
    mux218bit m21(outB, B, neg);
    rcadd8 fadd(outA, outB, Out, carryout);
    
    nor (Z, Out[0], Out[1], Out[2], Out[3], Out[4], Out[5], Out[6], Out[7]);
    assign N = Out[7];    
endmodule

module halfadd(s, c, a, b);
    input a, b;
    output s, c;
    
    xor (s, a, b);
    and (c, a, b);
endmodule

module add1(A, B, cin, sum, cout);
    input A;
    input B;
    input cin;
    output sum;
    output cout;
    wire w1, w2, w3;
    
//    xor (w1, A, B);
//    xor (sum, w1, cin);
//    and (w2, w1, cin);
//    and (w3, A, B);
//    or (cout, w2, w3);    
    halfadd h1(w1, w2, A, B);
    halfadd h2(sum, w3, w1, cin);
    or (cout, w2, w3);
endmodule

module rcadd8(A, B, Sum, Cout);
    input [7:0] A;
    input [7:0] B;
    output [7:0] Sum;
    output Cout;
    wire [6:0] c;
    
    add1 a1(A[0], B[0], 1'b0 , Sum[0], c[0]);
    add1 a2(A[1], B[1], c[0], Sum[1], c[1]);
    add1 a3(A[2], B[2], c[1], Sum[2], c[2]);
    add1 a4(A[3], B[3], c[2], Sum[3], c[3]);
    add1 a5(A[4], B[4], c[3], Sum[4], c[4]);
    add1 a6(A[5], B[5], c[4], Sum[5], c[5]);
    add1 a7(A[6], B[6], c[5], Sum[6], c[6]);
    add1 a8(A[7], B[7], c[6], Sum[7], Cout);
endmodule

module mux21(out, b, zero, s);
    output out;
    input b, zero, s;
    wire T1, T2, sbar;
    
    not (sbar, s);
    and (T1, zero, s), (T2, b, sbar);
    or (out, T1, T2);
endmodule

module mux218bit(Out, B, S);
    output [7:0] Out;
    input [7:0] B;
    input S;
    
    mux21 m1(Out[0], B[0], 1'b0, S);
    mux21 m2(Out[1], B[1], 1'b0, S);
    mux21 m3(Out[2], B[2], 1'b0, S);
    mux21 m4(Out[3], B[3], 1'b0, S);
    mux21 m5(Out[4], B[4], 1'b0, S);
    mux21 m6(Out[5], B[5], 1'b0, S);
    mux21 m7(Out[6], B[6], 1'b0, S);
    mux21 m8(Out[7], B[7], 1'b0, S);
endmodule

module mux31(out, a, one, abar, s1, s0);
    output out;
    input a, one, abar, s0, s1;
    wire s0bar, s1bar, T1, T2, T3, T4;
    
    not (s0bar, s0), (s1bar, s1);
    and (T1, a, s1bar, s0bar), (T2, one, s1bar, s0), (T3, abar, s1, s0bar), (T4, abar, s1, s0);
    or (out, T1, T2, T3, T4);
endmodule

module mux318bit(Out, A, Abar, S);
    output [7:0] Out;
    input [7:0] A;
    input [7:0] Abar;
    input [1:0] S;
    
    mux31 m1(Out[0], A[0], 1'b1, Abar[0], S[1], S[0]);
    mux31 m2(Out[1], A[1], 1'b0, Abar[1], S[1], S[0]);
    mux31 m3(Out[2], A[2], 1'b0, Abar[2], S[1], S[0]);
    mux31 m4(Out[3], A[3], 1'b0, Abar[3], S[1], S[0]);
    mux31 m5(Out[4], A[4], 1'b0, Abar[4], S[1], S[0]);
    mux31 m6(Out[5], A[5], 1'b0, Abar[5], S[1], S[0]);
    mux31 m7(Out[6], A[6], 1'b0, Abar[6], S[1], S[0]);
    mux31 m8(Out[7], A[7], 1'b0, Abar[7], S[1], S[0]);
endmodule

module comp2(Out, In);
    output [7:0] Out;
    input [7:0] In;
    
    wire [7:0] inv;
    wire cout;
    
    not (inv[0], In[0]);
    not (inv[1], In[1]);
    not (inv[2], In[2]);
    not (inv[3], In[3]);
    not (inv[4], In[4]);
    not (inv[5], In[5]);
    not (inv[6], In[6]);
    not (inv[7], In[7]);
    
    rcadd8 c2(inv, 8'b00000001, Out, cout);
endmodule