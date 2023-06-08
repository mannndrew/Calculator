module CarryLookAhead #(parameter N = 32)
(
	input [N-1:0] A,
	input [N-1:0] B,
	input cin,
	output [N-1:0] Sum,
	output OVR
);


/* -----------------------------Initialize Variables----------------------------- */


genvar i, j;

wire [N-1:0]B_or_Bnot;
wire [N-1:0] p;
wire [N-1:0] g;
wire [N:0] c;


/* -----------------------------Generate B_or_Bnot------------------------------- */


generate

for (i = 0; i < N; i = i + 1) begin : B_with_cin
	assign B_or_Bnot[i] = B[i]^cin;
end
	
endgenerate


/* -----------------------------Assign Propogate & Generate Terms---------------- */


assign 
	p[N-1:0] = (A[N-1:0] ^ B_or_Bnot[N-1:0]);
	
assign
	g[N-1:0] = (A[N-1:0] & B_or_Bnot[N-1:0]);


/* -----------------------------Assign Carry Terms------------------------------- */


/*
assign
c[1] = g[0] | (p[0] & cin),
c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & cin),
c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & cin);
c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & cin);

0 - 2 terms
1 - 3 terms
2 - 4 terms
*/

assign c[0] = cin;

generate

for (i = 1; i <= N; i = i + 1) begin : outer

	wire [i:0] term;

	for (j = 0; j < i+1; j = j + 1) begin : inner			// First Term
		if (j == 0)
			assign term[j] = g[i-1];
		
		else if (j == i)
			assign term[j] = &p[i-1:0] & cin;					// Last Term
		
		else
			assign term[j] = &p[i-1:i-j] & g[i-j-1];			// Middle Terms

	end
	
	assign c[i] = |term[i:0];										// Adds terms together
end

endgenerate


/* -----------------------------Assign Full Adders------------------------------- */


/*
FullAdder S0(.a(A[0]), .b(B[0]), .cin(c[0]), .sum(Sum[0]));
FullAdder S1(.a(A[1]), .b(B[1]), .cin(c[1]), .sum(Sum[1]));
FullAdder S2(.a(A[2]), .b(B[2]), .cin(c[2]), .sum(Sum[2]));
FullAdder S3(.a(A[3]), .b(B[3]), .cin(c[3]), .sum(Sum[3]));
*/

CLA_FullAdder S[N-1:0](.a(A[N-1:0]), .b(B_or_Bnot[N-1:0]), .cin(c[N-1:0]), .sum(Sum[N-1:0]));

assign OVR = c[N];

endmodule
