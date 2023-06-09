module ControlUnit
(
	input button, clk, reset,
	output clearInput,
	output [3:0] control
);

wire buttonDelayed, clearDelayed, loadDelayed, loadDelayedDelayed;
wire [3:0] signal;

assign clearInput = reset && clearDelayed;
assign control = {signal[3], signal[2], loadDelayedDelayed, signal[0]};

Delay L0
(
	.btn(button),
	.clk(clk),
	.pbPulse(buttonDelayed)
);

Controller L1
(
	.button(buttonDelayed),
	.reset(reset),
	.CAT(signal)
);

Delay L2
(
	.btn(buttonDelayed),
	.clk(clk),
	.pbPulse(clearDelayed)
);

Delay L3
(
	.btn(signal[2]),
	.clk(clk),
	.pbPulse(loadDelayed)
);

Delay L4
(
	.btn(loadDelayed),
	.clk(clk),
	.pbPulse(loadDelayedDelayed)
);

endmodule
