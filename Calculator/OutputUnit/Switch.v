module Switch
(
	input toggle,
	input [23:0] BCD_I,
	input [23:0] BCD_A,
	output reg [23:0] BCD
);

always @(toggle, BCD_I, BCD_A)
begin

	if (toggle == 0)
		BCD <= BCD_I;
		
	else
		BCD <= BCD_A;
	
end
endmodule
