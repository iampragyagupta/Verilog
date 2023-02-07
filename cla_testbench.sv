module cla_tb;
    reg [3:0] a, b;
    wire [3:0] sum;
    wire c_out;

  cla m1 (.a(a), .b(b), .sum(sum), .c_out(c_out));

    initial begin
      a = 0;b=0;
      $monitor("Sim time %t, a %b, b %b, sum  %b, c_out %b", $time,a,b,sum, c_out);
      #10 a = 4'b1001;
      $monitor("Sim time %t, a %b, b %b, sum  %b, c_out %b", $time,a,b,sum, c_out);
      #10 b = 4'b0110;
      $monitor("Sim time %t, a %b, b %b, sum  %b, c_out %b", $time,a,b,sum, c_out); 
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, a, b, sum, c_out);
    #30 $finish;
  end
endmodule
