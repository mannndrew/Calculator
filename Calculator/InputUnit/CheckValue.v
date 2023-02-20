module CheckValue
(
	input [15:0] BCD,
	output reg checkedFlag
);

always @(BCD)

	if (BCD[15:12] != 14 && BCD[15:12] != 0)
		checkedFlag = 1;
	
	
	else if (1 <= BCD[11:8]) 
	begin
	
		if (1 < BCD[11:8])
			checkedFlag = 1;
		
		else if (2 <= BCD[7:4]) 
		begin
		
			if (2 < BCD[7:4])
				checkedFlag = 1;
				
			else if (7 < BCD[3:0])
				checkedFlag = 1;
				
			else
				checkedFlag = 0;
		end
		
		else
			checkedFlag = 0;
	end
		
	else
		checkedFlag = 0;

endmodule
