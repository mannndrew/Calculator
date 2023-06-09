module OutputUnit
(
	input toggle,
	input [23:0] BCD_I,
	input [31:0] SW,
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0
);

wire [31:0] Invert;
wire [23:0] convertedBCD;
wire [23:0] signedBCD;
wire [23:0] BCD;

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
	.signBit(SW[31]),
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
	.in(BCD[3:0]),
	.out(HEX0)
);

DecimalDisplay tensDisplay
(
	.in(BCD[7:4]),
	.out(HEX1)
);

DecimalDisplay hundredsDisplay
(
	.in(BCD[11:8]),
	.out(HEX2)
);

DecimalDisplay thousandsDisplay
(
	.in(BCD[15:12]),
	.out(HEX3)
);

DecimalDisplay tenthousandsDisplay
(
	.in(BCD[19:16]),
	.out(HEX4)
);

DecimalDisplay hundredthousandsDisplay
(
	.in(BCD[23:20]),
	.out(HEX5)
);

endmodule
