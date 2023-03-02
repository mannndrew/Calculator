module CarryLookAhead #(parameter N = 4)
(
	input [N-1:0] A,
	input [N-1:0] B,
	input cin,
	output [N-1:0] Sum
);

wire [N-2:0] p;
wire [N-2:0] g;
wire [N-1:0] c;

assign 
	p[N-2:0] = (A[N-2:0] ^ B[N-2:0]);
	
assign
	g[N-2:0] = (A[N-2:0] & B[N-2:0]);
	
assign c[0] = cin;
	
assign
	c[1] = g[0] | (p[0] & cin),
	c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin),
	c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);

genvar i;
generate


//for (i = 0; i < N-1; i = i + 1) begin : carr_generator
//assign c[i+1] = g[i] | p[i] & c[i];							//WORK IN PROGRESS
//end


endgenerate

//FullAdder S0(.a(A[0]), .b(B[0]), .cin(c[0]), .sum(Sum[0]));
//FullAdder S1(.a(A[1]), .b(B[1]), .cin(c[1]), .sum(Sum[1]));
//FullAdder S2(.a(A[2]), .b(B[2]), .cin(c[2]), .sum(Sum[2]));
//FullAdder S3(.a(A[3]), .b(B[3]), .cin(c[3]), .sum(Sum[3]));

FullAdder S[N-1:0](.a(A[N-1:0]), .b(B[N-1:0]), .cin(c[N-1:0]), .sum(Sum[N-1:0]));

endmodule