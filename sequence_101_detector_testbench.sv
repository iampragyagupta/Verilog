module tb_seq_det;

 reg in;
 reg clk;
 reg reset;
 wire out;

 
 //moore_101 m1 (.in(in),.clk(clk),.reset(reset),.out(out));
 mealy_101 m1 (.in(in),.clk(clk),.reset(reset),.out(out));
  
 initial begin
    clk = 0;
    #100 $finish;
  end
  always #2 clk = ~clk; 
 
 initial begin
  in = 0;
   $monitor("Sim time %t, clk %b, reset %b, in %b, out %b, state %b", $time,clk,reset,in,out, m1.current_state);
  reset = 1;
  #8 reset = 0;
  #4 in = 1;
  #4 in = 0;
  #4 in = 0;
  #4 in = 1;
  #4 in = 0;
  #4 in = 1;
  #4 in = 0;
  #4 in = 1;
  #4 in = 1;
  #4 in = 0;
  #4 in = 1; 
  #4 in = 0;
  #4 in = 0;
  #4 $finish;
 end
 initial begin
    $dumpfile("dump.vcd");
   $dumpvars(0, clk, reset, in, out);
  end     
endmodule
