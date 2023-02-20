module keypad_base
(
	input clk,
	input [3:0] row,
	output [3:0] col,
	output [3:0] value,
	output valid,
	// Debug
	output slow_clock,
	output sense,
	output valid_digit,
	output [3:0] inv_row,
	output trig,
	output [3:0] state
);

assign inv_row = ~row;

clock_div #(.DIV(100000)) L0
(
	.clk(clk),
	.clk_out(slow_clock)
);

keypad_fsm L1
(
	.clk(slow_clock),
	.row(row),
	.col(col),
	.sense(sense),
	.trig(trig),
	.state(state)
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
