module bidir_tb;
  reg tb_oe;
  wire [7:0] out, bidir;
  reg [7:0] b, a ;
  bidir_buf b1(.oe(tb_oe), .in(a), .out(out), .bidir(bidir));
  assign bidir = (~tb_oe) ? b :8'bzzzzzzzz;
  
  
  initial begin
    tb_oe =0;
    #20 tb_oe =1;
    #40 $finish;
  end
  
  initial begin
    a = 8'd10;b =8'd110;
    $monitor("Sim time %t, in %b, tb_oe %b, bidir %b, out %b",$time,a,tb_oe,bidir,out);
    #10 a = 8'd20;b =8'd120;
    $monitor("Sim time %t, in %b, tb_oe %b, bidir %b, out %b",$time,a,tb_oe,bidir,out);
    #10 a = 8'd30;b =8'd130;
    $monitor("Sim time %t, in %b, tb_oe %b, bidir %b, out %b",$time,a,tb_oe,bidir,out);
    #10 a = 8'd40;b =8'd140;
    $monitor("Sim time %t, in %b, tb_oe %b, bidir %b, out %b",$time,a,tb_oe,bidir,out);
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, a, b, bidir, tb_oe, out);
  end
endmodule
