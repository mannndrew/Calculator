module SignPlace
(
	input signBit,
	input [39:0] BCD,
	output reg [43:0] signedBCD
);

always @(signBit, BCD)
	if (signBit==1'b1) begin
		if (BCD[39:4]==36'd0) begin
			signedBCD[3:0] = BCD[3:0];
			signedBCD[7:4] = 4'he;
			signedBCD[43:8] = 36'hfffffffff;
		end
		
		else if (BCD[39:8]==32'd0) begin
			signedBCD[7:0] = BCD[7:0];
			signedBCD[11:8] = 4'he;
			signedBCD[43:12] = 32'hffffffff;
		end
		
		else if (BCD[39:12]==28'd0) begin
			signedBCD[11:0] = BCD[11:0];
			signedBCD[15:12] = 4'he;
			signedBCD[43:16] = 28'hfffffff;
		end
		
		else if (BCD[39:16]==24'd0) begin
			signedBCD[15:0] = BCD[15:0];
			signedBCD[19:16] = 4'he;
			signedBCD[43:20] = 24'hffffff;
		end
		
		else if (BCD[39:20]==20'd0) begin
			signedBCD[19:0] = BCD[19:0];
			signedBCD[23:20] = 4'he;
			signedBCD[43:24] = 20'hfffff;
		end
		
		else if (BCD[39:24]==16'd0) begin
			signedBCD[23:0] = BCD[23:0];
			signedBCD[27:24] = 4'he;
			signedBCD[43:28] = 16'hffff;
		end
		
		else if (BCD[39:28]==12'd0) begin
			signedBCD[27:0] = BCD[27:0];
			signedBCD[31:28] = 4'he;
			signedBCD[43:32] = 12'hfff;
		end
		
		else if (BCD[39:32]==8'd0) begin
			signedBCD[31:0] = BCD[31:0];
			signedBCD[35:32] = 4'he;
			signedBCD[43:36] = 8'hff;
		end
		
		else if (BCD[39:36]==4'd0) begin
			signedBCD[35:0] = BCD[35:0];
			signedBCD[39:36] = 4'he;
			signedBCD[43:40] = 4'hf;
		end
		
		else begin
			signedBCD[39:0] = BCD[39:0];
			signedBCD[43:40] = 4'he;
		end
	end
	
	else begin
	
		if (BCD[39:4]==36'd0) begin
			signedBCD[3:0] = BCD[3:0];
			signedBCD[43:4] = 40'hffffffffff;
		end
		
		else if (BCD[39:8]==32'd0) begin
			signedBCD[7:0] = BCD[7:0];
			signedBCD[43:8] = 36'hfffffffff;
		end
		
		else if (BCD[39:12]==28'd0) begin
			signedBCD[11:0] = BCD[11:0];
			signedBCD[43:12] = 32'hffffffff;
		end
		
		else if (BCD[39:16]==24'd0) begin
			signedBCD[15:0] = BCD[15:0];
			signedBCD[43:16] = 28'hfffffff;
		end
		
		else if (BCD[39:20]==20'd0) begin
			signedBCD[19:0] = BCD[19:0];
			signedBCD[43:20] = 24'hffffff;
		end
		
		else if (BCD[39:24]==16'd0) begin
			signedBCD[23:0] = BCD[23:0];
			signedBCD[43:24] = 20'hfffff;
		end
		
		else if (BCD[39:28]==12'd0) begin
			signedBCD[27:0] = BCD[27:0];
			signedBCD[43:28] = 16'hffff;
		end
		
		else if (BCD[39:32]==8'd0) begin
			signedBCD[31:0] = BCD[31:0];
			signedBCD[43:32] = 12'hfff;
		end
		
		else if (BCD[39:36]==4'd0) begin
			signedBCD[35:0] = BCD[35:0];
			signedBCD[43:36] = 8'hff;
		end
		
		else begin
			signedBCD[39:0] = BCD[39:0];
			signedBCD[43:40] = 4'hf;
		end
	end
endmodule

