//module add3
//(
//	input [3:0] in,
//	output reg [3:0] out
//);
//
//always @ (in)
//	case (in)
//		4'b0000: out = 4'b0000;
//		4'b0001: out = 4'b0001;
//		4'b0010: out = 4'b0010;
//		4'b0011: out = 4'b0011;
//		4'b0100: out = 4'b0100;
//		4'b0101: out = 4'b1000;
//		4'b0110: out = 4'b1001;
//		4'b0111: out = 4'b1010;
//		4'b1000: out = 4'b1011;
//		4'b1001: out = 4'b1100;
//		default: out = 4'b0000;
//	endcase
//endmodule




module BinaryToBCD #(parameter N = 32)  // input width
(
	input [N-1:0] A,
	output reg [N+(N-4)/3:0] BCD   
);

integer i,j;

always @(A) begin
	for(i = 0; i <= N+(N-4)/3; i = i+1) BCD[i] = 0;     // initialize with zeros
		BCD[N-1:0] = A;                                   // initialize with input vector
		
		for(i = 0; i <= N-4; i = i+1)                       // iterate on structure depth
			for(j = 0; j <= i/3; j = j+1)                     // iterate on structure width
				if (BCD[N-i+4*j -: 4] > 4)                      // if > 4
					BCD[N-i+4*j -: 4] = BCD[N-i+4*j -: 4] + 4'd3; // add 3
end

endmodule
