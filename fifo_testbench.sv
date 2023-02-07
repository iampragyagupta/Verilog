module fifo_tb;
  parameter DATA_WIDTH = 8;
  
  reg clk, reset;
  reg w_en, r_en;
  reg [7:0] data_in;
  wire [7:0] data_out;
  wire full, empty;
  integer i;

  fifo f1(.clk(clk), .reset(reset), .w_en(w_en), .r_en(r_en), .data_in(data_in), .data_out(data_out), .full(full), .empty(empty));

  always #2 clk = ~clk;
  
  initial begin
    clk = 1'b0; reset = 1'b1;
    w_en = 1'b0; r_en =1'b0;
    data_in = 16;
    
    #4;
    @(posedge clk);
    reset = 1'b0;
    $monitor("Sim time %t, clk %b, reset %b, data_in %b, data_out %b, full %b, empty %b", $time,clk,reset,data_in,data_out, full, empty);
    w_en = 1'b1;
    for (i = 0; i < 8; i = i + 1) begin
      #(4)  
      data_in = data_in + 8'd1;  
    end
    w_en = 1'b0;
    #4
    r_en = 1'b1;
    #40 
    w_en = 1'b1;
    data_in = 8'd40;
    #10
    $finish;
    
  end  
  
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule
