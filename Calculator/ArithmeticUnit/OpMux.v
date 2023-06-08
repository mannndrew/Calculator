module OpMux
(
	input [2:0] op,
	output reg AddSub,
	output reg Left_Right,
	output reg Logic_Arithmetic
);

always @(op)
	case (op)
	3'b000: begin AddSub <= 1'b0; Left_Right <= 1'b0; Logic_Arithmetic <= 1'b0; end		// ADD
	3'b001: begin AddSub <= 1'b1; Left_Right <= 1'b0; Logic_Arithmetic <= 1'b0; end		// SUB
	3'b010: begin AddSub <= 1'b0; Left_Right <= 1'b0; Logic_Arithmetic <= 1'b0; end		// MUL
	3'b011: begin AddSub <= 1'b0; Left_Right <= 1'b0; Logic_Arithmetic <= 1'b0; end		// DIV
	3'b100: begin AddSub <= 1'b0; Left_Right <= 1'b0; Logic_Arithmetic <= 1'b0; end		// LSL
	3'b101: begin AddSub <= 1'b0; Left_Right <= 1'b1; Logic_Arithmetic <= 1'b0; end		// LSR
	3'b110: begin AddSub <= 1'b0; Left_Right <= 1'b0; Logic_Arithmetic <= 1'b1; end		// ASL
	3'b111: begin AddSub <= 1'b0; Left_Right <= 1'b1; Logic_Arithmetic <= 1'b1; end		// ASR
	endcase
	

endmodule

	
