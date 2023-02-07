module alu(a,b,sel,c_out,out);
  input [7:0] a;
  input [7:0] b;
  input [2:0] sel;
  output [7:0] out;
  output c_out;
  reg [7:0] res;
  wire [8:0] tmp;
  assign out = res;
  assign tmp = {1'b0,a} + {1'b0,b};
  assign c_out = tmp[8];
  always @(*)
    begin
      case(sel)
        3'b000: res = a+b; //add
        3'b001: res= a-b; //subtract
        3'b010: res= a*b; //multiply
        3'b011: res= a/b; //divide
        3'b100: res= a&b; //logical and
        3'b101: res= a | b; //logical or
        3'b110: res= a ^ b; //logical xor
        3'b111: res= ~(a^b); //logical xnor
        default: res = a+b;
      endcase
    end
endmodule
