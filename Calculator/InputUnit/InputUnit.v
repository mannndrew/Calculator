module InputUnit
(
	input clk,
	input load,
	input reset,
	input [3:0] row,
	output [3:0] col,
	output [8:0] led,
	output [15:0] BCD_I,
	output trig,
	output [3:0] state
);

wire valid;
wire negative;
wire [3:0] singleBCD;
wire [15:0] BCD_A;
wire validFlag;
wire [7:0] binary;
wire [7:0] tcBinary;

keypad_base L0
(
	.clk(clk),
	.row(row),
	.col(col),
	.value(singleBCD),
	.valid(valid),
	.trig(trig),
	.state(state)
);

shift_reg L1
(
	.trig(valid),
	.in(singleBCD),
	.out(BCD_A),
	.reset(reset)
);

shift_reg #(.START(65535)) LL1 
(
	.trig(valid),
	.in(singleBCD),
	.out(BCD_I),
	.reset(reset)
);

BCD2BinarySM L2
(
	.BCD(BCD_A),
	.binarySM(binary)
);

CheckValue L3
(
	.BCD(BCD_A),
	.checkedFlag(validFlag)
);

Complement_I L4
(
	.in(binary),
	.out(tcBinary)
);

assign led = {validFlag, tcBinary};



endmodule
