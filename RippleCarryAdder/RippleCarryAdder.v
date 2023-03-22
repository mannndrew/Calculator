module RippleCarryAdder #(parameter N=8)
(
	input [N-1:0] A,
	input [N-1:0] B,
	input cin,
	output [N-1:0] Sum
);

wire [N-1:0] carry;

FullAdder Sini (.a(A[0]), .b(B[0]), .cin(cin), .sum(Sum[0]), .cout(carry[0]));
FullAdder S[N-1:1] (.a(A[N-1:1]), .b(B[N-1:1]), .cin(carry[N-2:0]), .sum(Sum[N-1:1]), .cout(carry[N-1:1]));

//FullAdder S0(.a(A[0]), .b(B[0]), .cin(cin), .sum(Sum[0]), .cout(carry[0]));
//FullAdder S1(.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(Sum[1]), .cout(carry[1]));
//FullAdder S2(.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(Sum[2]), .cout(carry[2]));
//FullAdder S3(.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(Sum[3]), .cout(carry[3]));

endmodule



