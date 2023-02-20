module shift_reg #(parameter COUNT = 4, parameter WIDTH = 4, parameter START = 0)
(
	input trig, reset, dir, // Left = 0, Right = 1
	input [WIDTH-1:0] in,
	output reg [(COUNT*WIDTH)-1:0] out
);


reg first = 1;

always @ (posedge trig, negedge reset)
begin
	if (~reset) begin
		out <= START;
		first <= 1;
	end

	else
	begin
		if (dir)
		begin // 1 = Right
			out <= out >> WIDTH;
			out[(COUNT*WIDTH)-
			1:((COUNT*WIDTH)-1)-WIDTH] <= in;
		end
		
		else
		begin // 0 = Left
			if (first == 1 || in[WIDTH-1:0] != 4'b1110)
			begin
				out <= out << WIDTH;
				out[WIDTH-1:0] <= in;
				first <= 0;
			end
		end
	end
end

endmodule
