module SignPlace
(
	input signBit,
	input [23:0] BCD,
	output reg [23:0] signedBCD
);

always @(signBit, BCD)
	if (signBit==1'b1) begin
		if (BCD[23:4]==20'd0) begin
			signedBCD[3:0] = BCD[3:0];
			signedBCD[7:4] = 4'he;
			signedBCD[23:8] = 16'hffff;
		end
		
		else if (BCD[23:8]==16'd0) begin
			signedBCD[7:0] = BCD[7:0];
			signedBCD[11:8] = 4'he;
			signedBCD[23:12] = 12'hfff;
		end
		
		else if (BCD[23:12]==12'd0) begin
			signedBCD[11:0] = BCD[11:0];
			signedBCD[15:12] = 4'he;
			signedBCD[23:16] = 8'hff;
		end
		
		else if (BCD[23:16]==8'd0) begin
			signedBCD[15:0] = BCD[15:0];
			signedBCD[19:16] = 4'he;
			signedBCD[23:20] = 4'hf;
		end
		
		else begin
			signedBCD[19:0] = BCD[19:0];
			signedBCD[23:20] = 4'he;
		end
	end
	
	else begin
	
		if (BCD[23:4]==20'd0) begin
			signedBCD[3:0] = BCD[3:0];
			signedBCD[23:4] = 20'hfffff;
		end
		
		else if (BCD[23:8]==16'd0) begin
			signedBCD[7:0] = BCD[7:0];
			signedBCD[23:8] = 16'hffff;
		end
		
		else if (BCD[23:12]==12'd0) begin
			signedBCD[11:0] = BCD[11:0];
			signedBCD[23:12] = 12'hfff;
		end
		
		else if (BCD[23:16]==8'd0) begin
			signedBCD[15:0] = BCD[15:0];
			signedBCD[23:16] = 8'hff;
		end
		
		else if (BCD[23:20]==4'd0) begin
			signedBCD[19:0] = BCD[19:0];
			signedBCD[23:20] = 4'hf;
		end
		
		else begin
			signedBCD[23:0] = BCD[23:0];
		end
	end
	
endmodule

