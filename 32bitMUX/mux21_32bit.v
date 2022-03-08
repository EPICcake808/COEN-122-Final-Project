`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/03/2022 08:51:10 PM
// Design Name: 
// Module Name: mux21_32bit
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

module mux21(out, b, zero, s);
    output out;
    input b, zero, s;
    wire T1, T2, sbar;
    
    not (sbar, s);
    and (T1, zero, s), (T2, b, sbar);
    or (out, T1, T2);
endmodule

module mux21_32bit(Out, A, B, S);
    input [31:0] A;
    input [31:0] B;
    input S;
    output [31:0] Out;
    
    mux21 m1(Out[0], A[0], B[0], S);
    mux21 m2(Out[1], A[1], B[1], S);
    mux21 m3(Out[2], A[2], B[2], S);
    mux21 m4(Out[3], A[3], B[3], S);
    mux21 m5(Out[4], A[4], B[4], S);
    mux21 m6(Out[5], A[5], B[5], S);
    mux21 m7(Out[6], A[6], B[6], S);
    mux21 m8(Out[7], A[7], B[7], S);
    mux21 m9(Out[8], A[8], B[8], S);
    mux21 m10(Out[9], A[9], B[9], S);
    mux21 m11(Out[10], A[10], B[10], S);
    mux21 m12(Out[11], A[11], B[11], S);
    mux21 m13(Out[12], A[12], B[12], S);
    mux21 m14(Out[13], A[13], B[13], S);
    mux21 m15(Out[14], A[14], B[14], S);
    mux21 m16(Out[15], A[15], B[15], S);
    mux21 m17(Out[16], A[16], B[16], S);
    mux21 m18(Out[17], A[17], B[17], S);
    mux21 m19(Out[18], A[18], B[18], S);
    mux21 m20(Out[19], A[19], B[19], S);
    mux21 m21(Out[20], A[20], B[20], S);
    mux21 m22(Out[21], A[21], B[21], S);
    mux21 m23(Out[22], A[22], B[22], S);
    mux21 m24(Out[23], A[23], B[23], S);
    mux21 m25(Out[24], A[24], B[24], S);
    mux21 m26(Out[25], A[25], B[25], S);
    mux21 m27(Out[26], A[26], B[26], S);
    mux21 m28(Out[27], A[27], B[27], S);
    mux21 m29(Out[28], A[28], B[28], S);
    mux21 m30(Out[29], A[29], B[29], S);
    mux21 m31(Out[30], A[30], B[30], S);
    mux21 m32(Out[31], A[31], B[31], S);
endmodule
