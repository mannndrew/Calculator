module Switch
(
	input toggle,
	input [43:0] BCD_IU,
	input [43:0] BCD_AU,
	output reg [43:0] BCD
);

always @(toggle, BCD_IU, BCD_AU)
begin

	if (toggle == 0)
		BCD <= BCD_IU;
		
	else
		BCD <= BCD_AU;
	
end
endmodule
