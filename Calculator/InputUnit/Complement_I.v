module Complement_I
(
	input [7:0] in,
	output reg[7:0] out
);

always @(in)

	if (in[7]==0 || in == 8'b10000000)
		out = in;
		
	else
		out = {in[7], ~in[6:0]} + 1;

endmodule
