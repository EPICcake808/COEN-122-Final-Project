module alu_tb();
    
    reg [31:0] A;
    reg [31:0] B;
    reg add, inc, neg, sub;
    wire [31:0] out;
    wire Z, N;
    
    ALU test(A, B, add, inc, neg, sub, out, Z, N);
    initial
    begin
        A = 3;
        B = 4;
        add = 1;
        inc = 0;
        neg = 0;
        sub = 0;
        #50;
        
        add = 0;
        inc = 1;
        #50;
        
        inc = 0;
        neg = 1;
        #50;
        
        neg = 0;
        sub = 1;
        B = 2;
        #50;
        
        A = 2;
        #50;
        
        add = 1;
        inc = 1;
        neg = 1;
        #50;

        $finish;
    end
endmodule