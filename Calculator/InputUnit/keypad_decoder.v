module keypad_decoder
(
	input [3:0] row,
	input [3:0] col,
	output reg [3:0] value,
	output reg valid_in,
	output reg valid_dig,
	output reg valid_LR
);
always @ (row, col)
begin
	// 1 2 3 A
	// 4 5 6 B
	// 7 8 9 C
	// E 0 F D
	case ({row, col})
		8'b0001_0001: begin value = 1; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 1
		8'b0001_0010: begin value = 2; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 2
		8'b0001_0100: begin value = 3; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 3
		8'b0001_1000: begin value = 10; 	valid_in = 0; valid_dig = 0; valid_LR = 0; end
		8'b0010_0001: begin value = 4; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 4
		8'b0010_0010: begin value = 5; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 5
		8'b0010_0100: begin value = 6; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 6
		8'b0010_1000: begin value = 11; 	valid_in = 0; valid_dig = 0; valid_LR = 0; end
		8'b0100_0001: begin value = 7; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 7
		8'b0100_0010: begin value = 8; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 8
		8'b0100_0100: begin value = 9; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 9
		8'b0100_1000: begin value = 12; 	valid_in = 0; valid_dig = 0; valid_LR = 0; end 
		8'b1000_0001: begin value = 14; 	valid_in = 1; valid_dig = 0; valid_LR = 0; end 		// -
		8'b1000_0010: begin value = 0; 	valid_in = 1; valid_dig = 1; valid_LR = 0; end  	// 0
		8'b1000_0100: begin value = 15; 	valid_in = 0; valid_dig = 0; valid_LR = 1; end 		// Left
		8'b1000_1000: begin value = 13; 	valid_in = 0; valid_dig = 0; valid_LR = 1; end 		// Right
		default: begin value = 0; valid_in = 0; valid_dig = 0; valid_LR = 0; end
	endcase
end

endmodule
