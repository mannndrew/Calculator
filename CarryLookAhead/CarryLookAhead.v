module CarryLookAhead
(
	input [3:0] A,
	input [3:0] B,
	input cin,
	output [3:0] Sum
);

wire [2:0] p;
wire [2:0] g;
wire [3:0] c;

assign 
	p[0] = (A[0] ^ B[0]),
	p[1] = (A[1] ^ B[1]),
	p[2] = (A[2] ^ B[2]);
	
assign
	g[0] = (A[0] & B[0]),
	g[1] = (A[1] & B[1]),
	g[2] = (A[2] & B[2]);
	
assign c[0] = cin;
	
//assign
//	c0 = cin,
//	c1 = g0 | (p0 & cin),
//	c2 = g1 | (p1 & g0) | (p1 & p0 & cin),
//	c3 = g2 | (p2 & g1) | (p2 & p1 & g0) | (p2 & p1 & p0 & cin);

genvar i;
generate

for (i = 0; i < 3; i = i + 1) begin : carr_generator
assign c[i+1] = g[i] | p[i] & c[i];							//WORK IN PROGRESS
end


	
FullAdder S0(.a(A[0]), .b(B[0]), .cin(c[0]), .sum(Sum[0]));
FullAdder S1(.a(A[1]), .b(B[1]), .cin(c[1]), .sum(Sum[1]));
FullAdder S2(.a(A[2]), .b(B[2]), .cin(c[2]), .sum(Sum[2]));
FullAdder S3(.a(A[3]), .b(B[3]), .cin(c[3]), .sum(Sum[3]));
	
endgenerate
endmodule
