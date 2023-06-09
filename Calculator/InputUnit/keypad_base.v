module keypad_base
(
	input clk,
	input [3:0] row,
	output [3:0] col,
	output [3:0] value,
	output valid_in,
	output valid_digit,
	output valid_LR
);

wire slow_clock;
wire sense;
wire valid_in_I;
wire valid_digit_I;
wire valid_LR_I;

clock_div #(.DIV(100000)) L0 // 50MHz to 500Hz
(
	.clk(clk),
	.clk_out(slow_clock)
);

keypad_fsm L1
(
	.clk(slow_clock),
	.row(row),
	.col(col),
	.sense(sense)
);

keypad_decoder L2
(
	.row(row),
	.col(col),
	.value(value),
	.valid_in(valid_in_I),
	.valid_dig(valid_digit_I),
	.valid_LR(valid_LR_I)
);

assign valid_in = valid_in_I && sense;
assign valid_digit = valid_digit_I && sense;
assign valid_LR = valid_LR_I && sense;

endmodule
