module AD_PU
(
	input A,
	input B,
	input Cin,
	input Select,
	output Cout,
	output Down
);

wire Sum;

AD_FullAdder FA(.A(A), .B(~B), .C(Cin), .S(Sum), .Cout(Cout));
AD_MUX MU(.I0(A), .I1(Sum), .Select(Select), .Out(Down));

endmodule
