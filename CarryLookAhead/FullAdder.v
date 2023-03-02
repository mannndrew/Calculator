module FullAdder
(
	input a,
	input b,
	input cin,
	output sum
);

assign sum = (a ^ b ^ cin);

endmodule



