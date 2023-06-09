module Complement_O
(
	input [31:0] in,
	output reg[31:0] out
);

always @(in)

	if (in[31]==0)
		out = in;
	else
		out = ~in + 1'b1;

endmodule
