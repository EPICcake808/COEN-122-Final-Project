module assembly_code();
  assign instr[0] = 32'b   //SUB x4, x4, x4
  assign instr[1] = //ADD x5, x2, x3
  assign instr[2] = //SVPC x9, 1
  assign instr[3] = //LD x6, x2
  assign instr[4] = //NOP
  assign instr[5] = //NOP
  assign instr[6] = //ADD x4, x4, x6
  assign instr[7] = //INC x2, x2, 1
  assign instr[8] = //SUB x8, x2, x5
  assign inst[9] = //BRN x9
  
  
endmodule
