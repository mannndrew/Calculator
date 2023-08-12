module shift_reg #(parameter COUNT = 4, parameter WIDTH = 4, parameter START = 0)
(
	input clk, 
	input pre,
	input reset,
	input [WIDTH-1:0] in,
	output reg [(COUNT*WIDTH)-1:0] out
);

reg [1:0] prev;

always @(posedge clk) begin
	prev[0] <= pre;
	prev[1] <= prev[0];
end

wire jump = (prev == 2'b01) ? 1'b1 : 1'b0;


reg first = 1;

always @ (posedge clk, negedge reset) begin
	if (~reset) begin
		out <= START;
		first <= 1;
	end

	else if (jump) begin
		if (first == 1 || in[WIDTH-1:0] != 4'b1110) begin
			out <= out << WIDTH;
			out[WIDTH-1:0] <= in;
			first <= 0; 
		end
	end
	
	else begin
		out <= out;
		first <= first;
	end
end

endmodule
