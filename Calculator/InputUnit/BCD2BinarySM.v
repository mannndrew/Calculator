module BCD2BinarySM
(
	input [43:0] BCD_A,
	input [43:0] BCD_I,
	output reg [31:0] binarySM,
	output reg neg
);

always @(BCD_A) begin
binarySM = BCD_A[39:36]*(32'd1000000000) 
			+ BCD_A[35:32]*(32'd100000000) 
			+ BCD_A[31:28]*(32'd10000000) 
			+ BCD_A[27:24]*(32'd1000000) 
			+ BCD_A[23:20]*(32'd100000) 
			+ BCD_A[19:16]*(32'd10000) 
			+ BCD_A[15:12]*(32'd1000) 
			+ BCD_A[11:8]*(32'd100) 
			+ BCD_A[7:4]*(32'd10) 
			+ BCD_A[3:0]*(32'd1);
end	

always @(BCD_I) begin

	if (BCD_I[43:40] == 4'he || BCD_I[39:36] == 4'he || BCD_I[35:32] == 4'he || BCD_I[31:28] == 4'he || BCD_I[27:24] == 4'he || BCD_I[23:20] == 4'he || BCD_I[19:16] == 4'he || BCD_I[15:12] == 4'he || BCD_I[11:8] == 4'he || BCD_I[7:4] == 4'he || BCD_I[3:0] == 4'he)
		neg = 1'b1;
		
	else
		neg = 1'b0;

end
	
endmodule
