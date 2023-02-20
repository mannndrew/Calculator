module Delay
(
	input btn,
	input clk,
	output pbPulse
);

	reg [1:0] btnState;

	// If we see a edge now, but didnt 1 cycle ago, pulse
	assign pbPulse = btnState[1] & btnState[0];

	// Shift register storing the btn state now and 1 cycle ago
	always @(posedge clk) 
	begin
		btnState <= {btnState[0], btn};
	end
endmodule