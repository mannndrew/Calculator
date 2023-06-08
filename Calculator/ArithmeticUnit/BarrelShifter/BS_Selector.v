module BS_Selector #(parameter N=8) 
(
	input [N-1:0] I0,
	input [N-1:0] I1,
	input Select,
	output [N-1:0] Out
);

genvar i;
generate

for (i=0; i<N; i=i+1) begin : Main
	assign Out[i] = (I0[i] & ~Select) | (I1[i] & Select);
end

endgenerate
endmodule
