module BCD2BinarySM
(
	input [15:0] BCD,
	output reg [7:0] binarySM
);

always @(BCD)

if (BCD[15:12] == 4'b1110 && BCD[11:8] == 4'b0001 && BCD[7:4] == 4'b0010 && BCD[3:0] == 4'b1000)
	binarySM = 8'b10000000;
	
else if (BCD[15:12] == 4'b1110)
	binarySM = 8'b10000000 + BCD[11:8]*(8'b01100100) + BCD[7:4]*(8'b1010) + BCD[3:0];

else if (BCD[11:8] == 4'b1110)
	binarySM = 8'b10000000 + BCD[7:4]*(8'b1010) + BCD[3:0];
	
else if (BCD[7:4] == 4'b1110)
	binarySM = 8'b10000000 + BCD[3:0];
else if (BCD[3:0] == 4'b1110)
	binarySM = 8'b00000000;
else
	binarySM = BCD[11:8]*(8'b01100100) + BCD[7:4]*(8'b1010) + BCD[3:0];
endmodule
