module InputUnit
(
	input clk,
	input load,
	input reset,
	input [3:0] row,
	output [3:0] col,
	output [31:0] tcBinary,
	output [23:0] BCD_I
);

wire valid;
wire [3:0] singleBCD;
wire [23:0] BCD_A;
wire [31:0] binary;
wire neg;

keypad_base L0
(
	.clk(clk),
	.row(row),
	.col(col),
	.value(singleBCD),
	.valid(valid)
);

shift_reg #(.COUNT(6), .START(24'd0)) L1  //For Arithmetic Unit
(
	.trig(valid),
	.in(singleBCD),
	.out(BCD_A),
	.reset(reset)
);

shift_reg #(.COUNT(6), .START(24'hffffff)) LL1 //For Output Unit
(
	.trig(valid),
	.in(singleBCD),
	.out(BCD_I),
	.reset(reset)
);

BCD2BinarySM L2
(
	.BCD(BCD_A),
	.binarySM(binary),
	.neg(neg)
);

Complement_I #(.N(32)) L4
(
	.In(binary),
	.Flip(neg),
	.Out(tcBinary)
);

endmodule
