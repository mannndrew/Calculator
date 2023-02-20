module RegisterN #(parameter N=8)
(
	input Clear, Load,
	input [N-1:0] D,
	output reg [N-1:0] Q
);

always @(negedge Clear, negedge Load)
	if (Clear==0)
		Q = 0;
	
	else
		Q = D;

endmodule
