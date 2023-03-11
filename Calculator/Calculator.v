module Calculator
(
	input clk,
	input button,
	input reset,
	input addOrSub,
	input [3:0] row,
	output [3:0] col,
	output [6:0] HEX3, HEX2, HEX1, HEX0,
	output [8:0] LED
);

wire [15:0] BCD;
wire [7:0] binaryIn, binaryOut;
wire [3:0] control;
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
	.led(binaryIn),
	.BCD_I(BCD)
);

ArithmeticUnit L5
(
	.in(binaryIn),
	.LoadA(control[3]),
	.LoadB(control[2]),
	.LoadR(control[1]),
	.AddSub(addOrSub),
	.Reset(reset),
	.Result(binaryOut),
	.OVR(LED[8])
);

OutputUnit L6
(
	.toggle(control[0]),
	.BCD_I(BCD),
	.SW(binaryOut),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2),
	.HEX3(HEX3)
);

endmodule
