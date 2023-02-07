module ram (d_in, address, clk, w, out);
  input [7:0] d_in;
  input [4:0] address;
  input w, clk;
  output [7:0] out;
  reg [7:0] memory[31:0]; 
  reg [4:0] address_reg;
  always @(posedge clk)
	begin
      if (w)
        memory[address] <= d_in;
      else
        address_reg <= address;
    end
  assign out = memory[address_reg];
endmodule
