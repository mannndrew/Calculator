module SignPlace
(
	input signBit,
	input [15:0] BCD,
	output reg [15:0] signedBCD
);

always @(signBit, BCD)
	if (signBit==1'b1) begin
		if (BCD[7:4]==4'b0000 && BCD[11:8]==4'b0000) begin
			signedBCD[3:0] = BCD[3:0];
			signedBCD[7:4] = 4'b1110;
			signedBCD[11:8] = 4'b1111;
			signedBCD[15:12] = 4'b1111;
		end
		
		else begin
			if (BCD[11:8]==4'b0000) begin
				signedBCD[3:0] = BCD[3:0];
				signedBCD[7:4] = BCD[7:4];
				signedBCD[11:8] = 4'b1110;
				signedBCD[15:12] = 4'b1111;
			end
			
			else begin
				signedBCD[3:0] = BCD[3:0];
				signedBCD[7:4] = BCD[7:4];
				signedBCD[11:8] = BCD[11:8];
				signedBCD[15:12] = 4'b1110;
			end
		end
	end
	
	else begin
		if (BCD[7:4]==4'b0000 && BCD[11:8]==4'b0000) begin
			signedBCD[3:0] = BCD[3:0];
			signedBCD[7:4] = 4'b1111;
			signedBCD[11:8] = 4'b1111;
			signedBCD[15:12] = 4'b1111;
		end
		
		else begin
			if (BCD[11:8]==4'b0000) begin
				signedBCD[3:0] = BCD[3:0];
				signedBCD[7:4] = BCD[7:4];
				signedBCD[11:8] = 4'b1111;
				signedBCD[15:12] = 4'b1111;
			end
			
			else begin
				signedBCD[3:0] = BCD[3:0];
				signedBCD[7:4] = BCD[7:4];
				signedBCD[11:8] = BCD[11:8];
				signedBCD[15:12] = 4'b1111;
			end
		end
	end
endmodule

