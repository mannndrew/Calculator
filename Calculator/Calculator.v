module Calculator
(
	input clk,
	input button,
	input reset,
	input [2:0] op,
	input [3:0] row,
	output [3:0] col,
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0,
	output [7:0] LED
);

wire [43:0] BCD;
wire [31:0] binaryIn, binaryOut;
wire [3:0] control;
wire [2:0] count;
wire clearInput;

assign LED[3:0] = row[3:0];
assign LED[7:4] = col[3:0];

ControlUnit L0
(
	.button(button),
	.clk(clk),
	.reset(reset),
	.clearInput(clearInput), 
	.control(control)
);

InputUnit L3
(
	.clk(clk),
	.reset(clearInput),
	.row(row),
	.col(col),
	.tcBinary(binaryIn),
	.BCD_I(BCD),
	.count(count)
);

ArithmeticUnit L5
(
	.in(binaryIn),
	.LoadA(control[3]),
	.LoadB(control[2]),
	.LoadR(control[1]),
	.op(op),
	.Reset(reset),
	.Result(binaryOut)
);

OutputUnit L6
(
	.count(count),
	.toggle(control[0]),
	.BCD_IU(BCD),
	.SW(binaryOut),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3),
	.HEX4(HEX4),
	.HEX5(HEX5)
);

endmodule
