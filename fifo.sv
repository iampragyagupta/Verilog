module fifo (clk, reset, w_en, r_en, data_in, data_out,full, empty);
  input clk, reset;
  input w_en, r_en;
  input [7:0] data_in;
  output reg [7:0] data_out;
  output full, empty;

  
reg [3:0] w_ptr, r_ptr;
reg [7:0] fifo[7:0];
wire wrap;
  
  // Set Default values on reset.
always@(posedge clk or posedge reset) begin
  if(reset) begin
      w_ptr <= 0; 
      r_ptr <= 0;
      data_out <= 0;
    end
  else
    begin
      if(w_en & !full) begin
        fifo[w_ptr[2:0]] <= data_in;
        w_ptr <= w_ptr + 1;
      end
      if(r_en & !empty) begin
        data_out <= fifo[r_ptr[2:0]];
        r_ptr <= r_ptr + 1;
      end
    end
  end
  
  assign wrap = r_ptr[3]^w_ptr[3];
  assign full = wrap & (w_ptr[2:0] == r_ptr[2:0]);
  assign empty = (w_ptr == r_ptr);
  
endmodule
