module FullAdder
(
	input a,
	input b,
	input cin,
	output cout,
	output sum
);

//assign {cout, sum} = a + b + cin;
assign cout = (a && b) || ((a ^ b) && cin);
assign sum = (a ^ b ^ cin);

endmodule



