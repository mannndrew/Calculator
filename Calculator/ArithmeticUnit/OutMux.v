module OutMux #(parameter N=32)
(
	input [2:0] op,
	input [N-1:0] Add,
	input [N-1:0] Multiply,
	input [N-1:0] Divide,
	input [N-1:0] Shift,
	output reg [N-1:0] Out
);

always @(*)
	case (op)
	3'b000: Out <= Add;
	3'b001: Out <= Add;
	3'b010: Out <= Multiply;
	3'b011: Out <= Divide;
	3'b100: Out <= Shift;
	3'b101: Out <= Shift;
	3'b110: Out <= Shift;
	3'b111: Out <= Shift;
	endcase
endmodule

	
