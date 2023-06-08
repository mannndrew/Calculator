module ArrayDivider #(parameter N=32)
(
	input [N-1:0] Dividend,
	input [N-1:0] Divisor,
	output [N-1:0] Quotient
);

genvar i, j;

wire [N-1:0] Dividend_Pos;
wire [N-1:0] Divisor_Pos;
wire [N-1:0] Quotient_Sig;

wire Ground = 1'b0;
wire Vcc = 1'b1;
wire [N-2:0] Carry [N-1:0];
wire [N-1:0] Down [N-1:0];

AD_TwosComplement #(.N(N)) AdderA(.In(Dividend), .Flip(Dividend[N-1]), .Out(Dividend_Pos));
AD_TwosComplement #(.N(N)) AdderB(.In(Divisor), .Flip(Divisor[N-1]), .Out(Divisor_Pos));

generate
	for (i=0; i<N; i=i+1) begin : Grid
	
		if (i==0) begin
			AD_PU FirstRow1(.A(Dividend_Pos[N-1]), .B(Divisor_Pos[0]), .Cin(Vcc), .Cout(Carry[0][0]), .Select(Quotient_Sig[N-1]), .Down(Down[0][0]));
		
			for (j=1; j<N-1; j=j+1) begin : First
				AD_PU FirstRow2(.A(Ground), .B(Divisor_Pos[j]), .Cin(Carry[0][j-1]), .Cout(Carry[0][j]), .Select(Quotient_Sig[N-1]), .Down(Down[0][j]));
			end
			
			AD_PU FirstRow3(.A(Ground), .B(Divisor_Pos[N-1]), .Cin(Carry[0][N-2]), .Cout(Quotient_Sig[N-1]), .Select(Quotient_Sig[N-1]), .Down(Down[0][N-1]));
		end
		
		
		
		else begin
		
			AD_PU AllRow1(.A(Dividend_Pos[N-i-1]), .B(Divisor_Pos[0]), .Cin(Vcc), .Cout(Carry[i][0]), .Select(Quotient_Sig[N-i-1]), .Down(Down[i][0]));
		
			for (j=1; j<N-1; j=j+1) begin : First
				AD_PU AllRow2(.A(Down[i-1][j-1]), .B(Divisor_Pos[j]), .Cin(Carry[i][j-1]), .Cout(Carry[i][j]), .Select(Quotient_Sig[N-i-1]), .Down(Down[i][j]));
			end
			
			AD_PU AllRow3(.A(Down[i-1][N-2]), .B(Divisor_Pos[N-1]), .Cin(Carry[i][N-2]), .Cout(Quotient_Sig[N-i-1]), .Select(Quotient_Sig[N-i-1]), .Down(Down[i][N-1]));
		
		end
	end
endgenerate

AD_TwosComplement #(.N(N)) AdderQ(.In(Quotient_Sig), .Flip(Dividend[N-1] ^ Divisor[N-1]), .Out(Quotient));

endmodule
