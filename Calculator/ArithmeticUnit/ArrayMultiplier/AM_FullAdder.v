module AM_FullAdder
(
	input a, 
	input b,
	input cin,
	output sum,
	output carry
);

assign sum = (a ^ b ^ cin);
assign carry = (a & b) | (b & cin) | (a & cin);

endmodule
