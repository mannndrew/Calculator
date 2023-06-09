module Complement_I #(parameter N = 8)
(
	input [N-1:0] In,
	input Flip,
	output [N-1:0] Out
);

/* -----------------------------Initialize Variables----------------------------- */


genvar i, j;

wire [N-1:0] IN_or_INnot;
wire [N-1:0] c;


/* -----------------------------Generate B_or_Bnot------------------------------- */


generate

for (i = 0; i < N; i = i + 1) begin : In_with_Flip
	assign IN_or_INnot[i] = In[i]^Flip;
end
	
endgenerate


/* -----------------------------Assign Carry Terms------------------------------- */


/*
assign
c[1] = (p[0] & cin),
c[2] = (p[1] & p[0] & cin),
c[3] = (p[2] & p[1] & p[0] & cin);
c[4] = (p[3] & p[2] & p[1] & p[0] & cin);

0 - 2 terms
1 - 3 terms
2 - 4 terms
*/

assign c[0] = Flip;

generate

for (i = 1; i < N; i = i + 1) begin : carry
	assign c[i] = &IN_or_INnot[i-1:0] & Flip;
end

for (i = 0; i < N; i = i + 1) begin : result
	assign Out[i] = IN_or_INnot[i] ^ c[i];
end

endgenerate

endmodule

