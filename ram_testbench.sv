module test;
  reg [7:0] d_in;
  
  reg [4:0] address;
  reg w, clk;
  wire [7:0] out;
  ram r1(.d_in(d_in), .address(address), .clk(clk), .w(w), .out(out));
  initial begin
    $monitor("Sim time %t, d_in %b, address %b, clk %b, w %b, out %b", $time,d_in,address,clk,w,out);
    clk =1'b1;
	forever #5 clk=~clk;
	end
 
  initial begin
  // writing data into the memory
  w =1'b1;
  #20;
  address=5'd0;
  d_in = 8'h10;
  #20;

  address=5'd2;
  d_in = 8'h11;
  #20;

  address=5'd7;
  d_in = 8'haf;
  #20;

  //reading data from the memory
  w = 1'b0;

  address=5'd0;
  #20;

  address=5'd2;
  #20;

  address=5'd7;
  #20;

  $finish;
  end
   end
  initial begin
    $dumpfile("dump.vcd");
   $dumpvars;
  end    
endmodule
