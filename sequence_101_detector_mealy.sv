module mealy_101(in,clk,reset,out);
  input clk; 
  input reset; 
  input in;
  output out; 
  parameter  
  Idle=3'b00, //Start 
  State_1=3'b01, //First 1
  State_10=3'b10; //0
  
  reg [2:0] current_state, next_state;
  reg out; 
  
  
  // sequential always
  always @(posedge clk, posedge reset)
  begin
    if(reset==1) 
      current_state <= Idle;
 	else
      current_state <= next_state; 
  end 
  //FSM
  always @(current_state,in)
  begin
    out = 1'b0;
    case(current_state) 
      Idle: begin
        if(in==1) next_state = State_1;
        else next_state = Idle;
      end
      State_1: begin
        if(in==0) next_state = State_10;
        else next_state = State_1;
      end
      State_10: begin
        if(in==1) begin
          out = 1'b1;
          next_state = State_1;
        end
        else next_state = Idle;
      end
      default:next_state = Idle;
    endcase
  end
endmodule
