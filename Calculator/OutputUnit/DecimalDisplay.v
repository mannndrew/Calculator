
module DecimalDisplay 
(
	input [3:0] in,
	output reg [6:0] out
);

	always @ (in) 
		case (in)
			4'b0000: out = 7'b1000000;   //0
			4'b0001: out = 7'b1111001;   //1
			4'b0010: out = 7'b0100100;   //2
			4'b0011: out = 7'b0110000;   //3
			4'b0100: out = 7'b0011001;   //4
			4'b0101: out = 7'b0010010;   //5
			4'b0110: out = 7'b0000010;   //6
			4'b0111: out = 7'b1111000;   //7
			4'b1000: out = 7'b0000000;   //8
			4'b1001: out = 7'b0011000;   //9
			4'b1110: out = 7'b0111111;   //-
			4'b1111: out = 7'b1111111;   //Blank
			default: out = 7'b1111111;   //Blank
		endcase
endmodule
	