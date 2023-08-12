module Counter
(
	input clk,
	input pre,
	input [3:0] value,
	input reset,
	output reg [2:0] count
);

reg [1:0] prev;
wire jump;

always @(posedge clk) begin
	prev[0] <= pre;
	prev[1] <= prev[0];
end

assign jump = (prev == 2'b01) ? 1'b1 : 1'b0;

always @(posedge clk, negedge reset) begin

	if (reset == 1'b0) begin
		count <= 3'd0;
	end
		
	else if (jump) begin
		if (value == 4'b1111 && count != 3'd5)
			count <= count + 3'd1;
		else if (value == 4'b1101 && count != 3'd0)
			count <= count - 3'd1;
		else
			count <= count;
	end
	
	else begin
		count <= count;
	end
			
end

endmodule
