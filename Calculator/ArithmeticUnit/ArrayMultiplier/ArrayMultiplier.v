module ArrayMultiplier #(parameter N = 32)
(
	input [N-1:0] A,
	input [N-1:0] B,
	output [N-1:0] Z
);

genvar i, j;

wire p[N][N];
wire carry[N-1][N];
wire sum[N-1][N];



generate
	for (i=0; i<N; i=i+1) begin : outer
		for (j=0; j<N; j=j+1) begin : inner
			assign p[i][j] = A[j] & B[i];
		end
	end
endgenerate




generate
	for (i=0; i<N-1; i=i+1) begin : Grid
	
		if (i == 0) begin
			AM_HalfAdder FirstRowHalf1(.a(p[0][1]), .b(p[1][0]), .sum(sum[0][0]), .carry(carry[0][0]));
			
			for (j=0; j<N-2; j=j+1) begin : FirstFull
				AM_FullAdder FirstRowFull2(.a(p[0][j+2]), .b(p[1][j+1]), .cin(carry[0][j]), .sum(sum[0][j+1]), .carry(carry[0][j+1]));
			end
			
			AM_HalfAdder FirstRowHalf3(.a(p[1][N-1]), .b(carry[0][N-2]), .sum(sum[0][N-1]), .carry(carry[0][N-1]));
		end
		
		
		
		else begin
			AM_HalfAdder RestRowHalf1(.a(p[i+1][0]), .b(sum[i-1][1]), .sum(sum[i][0]), .carry(carry[i][0]));
			
			for (j=0; j<N-2; j=j+1) begin : AllFull
				AM_FullAdder RestRowFull2(.a(p[i+1][j+1]), .b(sum[i-1][j+2]), .cin(carry[i][j]), .sum(sum[i][j+1]), .carry(carry[i][j+1]));
			end
			
			AM_FullAdder RestRowHalf3(.a(p[i+1][N-1]), .b(sum[i-1][N-1]), .cin(carry[i][N-2]), .sum(sum[i][N-1]), .carry(carry[i][N-1])); 
		end
		
	end
endgenerate



generate
	for (i=0; i<N; i=i+1) begin : Output
		if (i == 0)
			assign Z[i] = p[0][0];
			
		else
			assign Z[i] = sum[i-1][0];
	end
endgenerate


endmodule
