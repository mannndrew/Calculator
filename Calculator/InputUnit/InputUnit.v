module InputUnit
(
	input clk,
	input load,
	input reset,
	input [3:0] row,
	output [3:0] col,
	output [31:0] tcBinary,
	output [43:0] BCD_I,
	output [2:0] count
);

wire valid_in;
wire valid_digit;
wire valid_LR;

wire [3:0] singleBCD;
wire [43:0] BCD_A;
wire [31:0] binary;
wire neg;

keypad_base L0
(
	.clk(clk),
	.row(row),
	.col(col),
	.value(singleBCD),
	.valid_in(valid_in),
	.valid_digit(valid_digit),
	.valid_LR(valid_LR)
);

shift_reg #(.COUNT(11), .START(44'd0)) L1  //For Arithmetic Unit
(
	.trig(valid_digit),
	.in(singleBCD),
	.out(BCD_A),
	.reset(reset)
);

shift_reg #(.COUNT(11), .START(44'hfffffffffff)) LL1 //For Output Unit
(
	.trig(valid_in),
	.in(singleBCD),
	.out(BCD_I),
	.reset(reset)
);

Counter LC
(
	.left_right(valid_LR),
	.value(singleBCD),
	.reset(reset),
	.count(count)
);

BCD2BinarySM L2
(
	.BCD_A(BCD_A),
	.BCD_I(BCD_I),
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
