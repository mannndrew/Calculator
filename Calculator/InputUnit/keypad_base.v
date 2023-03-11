module keypad_base
(
	input clk,
	input [3:0] row,
	output [3:0] col,
	output [3:0] value,
	output valid
);

wire slow_clock;
wire valid_digit;
wire sense;

clock_div #(.DIV(10000)) L0 // 50MHz to 500Hz
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
	.valid(valid_digit)
);

assign valid = valid_digit && sense;

endmodule
