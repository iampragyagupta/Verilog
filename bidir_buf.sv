module bidir_buf (oe, in, out, bidir);

//If oe=1, bidir acts as output port and its input is on port in
//If oe=0, bidir acts as input port and its output is on port out  
// Port Declaration

input   oe;

input   [7:0] in;
output  [7:0] out;
inout   [7:0] bidir;


assign bidir = oe ? in : 8'bzzzzzzzz ;
assign out = (~oe) ? bidir : 8'b0 ;

endmodule
