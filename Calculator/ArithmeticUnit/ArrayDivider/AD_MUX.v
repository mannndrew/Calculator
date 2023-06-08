module AD_MUX
(
	input I0,
	input I1,
	input Select,
	output Out
);

assign Out = (I0 & ~Select) | (I1 & Select);
endmodule
