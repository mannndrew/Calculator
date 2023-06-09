module Counter
(
	input left_right,
	input [3:0] value,
	input reset,
	output reg [2:0] count
);

always @(posedge left_right, negedge reset) begin

	if (reset == 1'b0) begin
		count <= 3'd0;
	end
		
	else begin
		if (value == 4'b1111 && count != 3'd5)
			count <= count + 3'd1;
		else if (value == 4'b1101 && count != 3'd0)
			count <= count - 3'd1;
		else
			count <= count;
	end
			
end

endmodule
