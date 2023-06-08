module AD_FullAdder
(
	input A, 
	input B,
	input C,
	output S,
	output Cout
);

assign S = (A ^ B ^ C);
assign Cout = (A & B) | (B & C) | (A & C);

endmodule
