module BarrelShifter #(parameter N=32)
(
	input [N-1:0] Input,
	input [$clog2(N)-1:0] Shift_Val,
	input Left_Right,
	input Logic_Arithmetic,
	output [N-1:0] Result
);

genvar i, j;
generate

wire Left_MUX_Out[$clog2(N)][N];
wire Right_MUX_Out[$clog2(N)][N];

wire [N-1:0] Left_Out;
wire [N-1:0] Right_Out;

wire ASR_Check = Logic_Arithmetic & Input[N-1];

for (i=N/2; 0<i; i=i/2) begin : All

	if (i == N/2) begin
	
		for (j=0; j<N; j=j+1) begin : Left_First
			if (j < i)
				BS_MUX Left_MUX(.I0(Input[j]), .I1(1'b0), .Select(Shift_Val[$clog2(i)]), .Out(Left_MUX_Out[$clog2(i)][j]));

			else
				BS_MUX Left_MUX(.I0(Input[j]), .I1(Input[j-i]), .Select(Shift_Val[$clog2(i)]), .Out(Left_MUX_Out[$clog2(i)][j]));
		end
	
		for (j=0; j<N; j=j+1) begin : Right_First
			if (j < N-i)
				BS_MUX Right_MUX(.I0(Input[j]), .I1(Input[j+i]), .Select(Shift_Val[$clog2(i)]), .Out(Right_MUX_Out[$clog2(i)][j]));

			else
				BS_MUX Right_MUX(.I0(Input[j]), .I1(ASR_Check), .Select(Shift_Val[$clog2(i)]), .Out(Right_MUX_Out[$clog2(i)][j]));
		end
		
	end
	
	
	
	else begin
	
		for (j=0; j<N; j=j+1) begin : Left_Rest
			if (j < i)
				BS_MUX Left_MUX(.I0(Left_MUX_Out[$clog2(i)+1][j]), .I1(1'b0), .Select(Shift_Val[$clog2(i)]), .Out(Left_MUX_Out[$clog2(i)][j]));

			else
				BS_MUX Left_MUX(.I0(Left_MUX_Out[$clog2(i)+1][j]), .I1(Left_MUX_Out[$clog2(i)+1][j-i]), .Select(Shift_Val[$clog2(i)]), .Out(Left_MUX_Out[$clog2(i)][j]));
		end
	
		for (j=0; j<N; j=j+1) begin : Right_Rest
			if (j < N-i)
				BS_MUX Right_MUX(.I0(Right_MUX_Out[$clog2(i)+1][j]), .I1(Right_MUX_Out[$clog2(i)+1][j+i]), .Select(Shift_Val[$clog2(i)]), .Out(Right_MUX_Out[$clog2(i)][j]));

			else
				BS_MUX Right_MUX(.I0(Right_MUX_Out[$clog2(i)+1][j]), .I1(ASR_Check), .Select(Shift_Val[$clog2(i)]), .Out(Right_MUX_Out[$clog2(i)][j]));
		end
		
	end
	
end


for (i=0; i<N; i=i+1) begin : Output_Vars
	assign Left_Out[i] = Left_MUX_Out[0][i];
	assign Right_Out[i] = Right_MUX_Out[0][i];
end

endgenerate


BS_Selector #(.N(N)) S1(.I0(Left_Out), .I1(Right_Out), .Select(Left_Right), .Out(Result));

endmodule
