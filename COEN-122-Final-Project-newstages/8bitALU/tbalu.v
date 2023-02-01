`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/27/2022 08:48:10 AM
// Design Name: 
// Module Name: tbalu
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


module tbalu();
    reg [7:0] A;
    reg [7:0] B;
    reg add, inc, neg, sub;
    wire [7:0] Out;
    wire Z, N;
//    wire carryout;
    
/*    rcadd8 test(A, B, Out, carryout);
    
initial
begin
    A = 20;
    B = 20;
    
    #100;
    
    A = 4;
    B = 6;
    
    #100;
    $finish;
end


    mux218bit test(Out, B, neg);

initial
begin
   B = 20;
   neg = 0;
   
   #100;
   
   neg = 1;
   
   #100;
   $finish;
end

    comp2 test(Out, A);
initial
begin
    A = 20;
    
    #100;
    $finish;
end
*/
    alu test(A, B, add, inc, neg, sub, Out, Z, N);
    
initial
begin
//initialize
//add 20 + 20
    A = 20;
    B = 20;
    add = 1;
    inc = 0;
    neg = 0;
    sub = 0;
    
    #100;
//incrrement 20 + 1  
    add = 0;
    inc = 1;
    
    #100;
//return negative A    
    inc = 0;
    neg = 1;
    
    #100;
//subtract 20 - 20    
    neg = 0;
    sub = 1;
    
    #100;
//subtract 5 - 20    
    B = 5;
    
    #100;
    
    $finish;
end

endmodule
