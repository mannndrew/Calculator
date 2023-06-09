module OutputUnit
(
	input toggle,
	input [2:0] count,
	input [43:0] BCD_IU,
	input [31:0] SW,
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0
);

wire [31:0] Invert;
wire [39:0] convertedBCD;
wire [43:0] BCD_AU;
wire [43:0] BCD_Full;
wire [23:0] BCD_Out;

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
	.signedBCD(BCD_AU)
);

Switch L3
(
	.toggle(toggle),
	.BCD_IU(BCD_IU),
	.BCD_AU(BCD_AU),
	.BCD(BCD_Full)
);

Display_MUX DMUX
(
	.count(count),
	.BCD_In(BCD_Full),
	.BCD_Out(BCD_Out)
);

DecimalDisplay onesDisplay
(
	.in(BCD_Out[3:0]),
	.out(HEX0)
);

DecimalDisplay tensDisplay
(
	.in(BCD_Out[7:4]),
	.out(HEX1)
);

DecimalDisplay hundredsDisplay
(
	.in(BCD_Out[11:8]),
	.out(HEX2)
);

DecimalDisplay thousandsDisplay
(
	.in(BCD_Out[15:12]),
	.out(HEX3)
);

DecimalDisplay tenthousandsDisplay
(
	.in(BCD_Out[19:16]),
	.out(HEX4)
);

DecimalDisplay hundredthousandsDisplay
(
	.in(BCD_Out[23:20]),
	.out(HEX5)
);

endmodule
