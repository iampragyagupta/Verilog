module test;
  reg[7:0] a,b;
  reg[2:0] sel;
  wire[7:0] out;
  wire c_out;
  integer i;
  alu a1(.a(a), .b(b), .sel(sel), .c_out(c_out), .out(out));
  initial begin
    $monitor("Sim time %t, a %b, b %b, sel %b, c_out %b, out %b", $time,a,b,sel,c_out,out);
    a = 8'b100;
    b = 8'b101;
    sel = 3'b000;
    for( i=0; i<8; i= i+1)
      begin
        sel = i;
        #5;
      end
    
  end
  initial begin
    $dumpfile("dump.vcd");
   $dumpvars;
  end    
endmodule
