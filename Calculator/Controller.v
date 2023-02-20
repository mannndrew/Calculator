
module Controller
(
	input button, reset,
	output reg [3:0] CAT
);

reg [1:0] state, nextstate; 

always @ (negedge button, negedge reset)
	if (reset == 0) 
		state <= 2'b00; 
	else 
		state <= nextstate;

always @ (state)
	case ({state})
		2'b00: begin nextstate = 2'b01; CAT = 4'b1110; end
		2'b01: begin nextstate = 2'b10; CAT = 4'b0110; end
		2'b10: begin nextstate = 2'b10; CAT = 4'b1001; end
		2'b11: begin nextstate = 2'b11; CAT = 4'b0000; end
	endcase
endmodule
