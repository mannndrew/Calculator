module Complement_O
(
	input [7:0] in,
	output reg[7:0] out
);

always @(in)

	if (in[7]==0)
		out = in;
	else
		out = ~in + 1;

endmodule
