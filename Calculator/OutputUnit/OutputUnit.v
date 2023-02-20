module OutputUnit
(
	input toggle,
	input [15:0] BCD_I,
	input [7:0] SW,
	output [6:0] HEX3, HEX2, HEX1, HEX0
);

wire [7:0] Invert;
wire [15:0] convertedBCD;
wire [15:0] signedBCD;
wire [15:0] BCD;

Complement_O L0
(
	.in(SW),
	.out(Invert)
);

BinaryToBCD L1
(
	.A(Invert),
	.BCD(convertedBCD)
);

SignPlace L2
(
	.signBit(SW[7]),
	.BCD(convertedBCD),
	.signedBCD(signedBCD)
);

Switch L3
(
	.toggle(toggle),
	.BCD_I(BCD_I),
	.BCD_A(signedBCD),
	.BCD(BCD)
);

DecimalDisplay onesDisplay
(
	//.in(signedBCD[3:0]),
	.in(BCD[3:0]),
	.out(HEX0)
);

DecimalDisplay tensDisplay
(
	//.in(signedBCD[7:4]),
	.in(BCD[7:4]),
	.out(HEX1)
);

DecimalDisplay hundredsDisplay
(
	//.in(signedBCD[11:8]),
	.in(BCD[11:8]),
	.out(HEX2)
);

DecimalDisplay signDisplay
(
	//.in(signedBCD[15:12]),
	.in(BCD[15:12]),
	.out(HEX3)
);

endmodule
