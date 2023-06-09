module BCD2BinarySM
(
	input [23:0] BCD,
	output reg [31:0] binarySM,
	output reg neg
);

always @(BCD)
	
if (BCD[23:20] != 4'b1110 && BCD[19:16] != 4'b1110 && BCD[15:12] != 4'b1110 && BCD[11:8] != 4'b1110 && BCD[7:4] != 4'b1110 && BCD[3:0] != 4'b1110)
	begin neg = 1'b0; binarySM = BCD[23:20]*(32'd100000) + BCD[19:16]*(32'd10000) + BCD[15:12]*(32'd1000) + BCD[11:8]*(32'd100) + BCD[7:4]*(32'd10) + BCD[3:0]*(32'd1); end
	
else if (BCD[23:20] == 4'b1110)
	begin neg = 1'b1; binarySM = BCD[19:16]*(32'd10000) + BCD[15:12]*(32'd1000) + BCD[11:8]*(32'd100) + BCD[7:4]*(32'd10) + BCD[3:0]*(32'd1); end
	
else if (BCD[19:16] == 4'b1110)
	begin neg = 1'b1; binarySM = BCD[15:12]*(32'd1000) + BCD[11:8]*(32'd100) + BCD[7:4]*(32'd10) + BCD[3:0]*(32'd1); end
	
else if (BCD[15:12] == 4'b1110)
	begin neg = 1'b1; binarySM = BCD[11:8]*(32'd100) + BCD[7:4]*(32'd10) + BCD[3:0]*(32'd1); end
	
else if (BCD[11:8] == 4'b1110)
	begin neg = 1'b1; binarySM = BCD[7:4]*(32'd10) + BCD[3:0]*(32'd1); end
	
else if (BCD[7:4] == 4'b1110)
	begin neg = 1'b1; binarySM = BCD[3:0]*(32'd1); end
	
else if (BCD[3:0] == 4'b1110)
	begin neg = 1'b0; binarySM = 32'd0; end
	
else
	begin neg = 1'b0; binarySM = 32'd0; end
	

	
endmodule
