
module FullAdder (
	input ai,bi,cini,invert,
	output si,couti
);
	
	assign {couti, si} = ai + (bi^invert) + cini;
	
endmodule



module AdderSub #(parameter N=8)
(
	input [N-1:0] A,
	input [N-1:0] B,
	input AddSub,
	output OVR,
	output [N-1:0] Sum
);

	wire [N-1:0] C;
	wire [N-1:0] split;
	
	FullAdder Sini(.ai(A[0]), .bi(B[0]), .cini(AddSub), .si(Sum[0]), .couti(C[0]), .invert(AddSub));
	FullAdder S[N-1:1](.ai(A[N-1:1]), .bi(B[N-1:1]), .cini(C[N-2:0]), .si(Sum[N-1:1]), .couti(C[N-1:1]), .invert(AddSub));
	
	//FullAdder S1(.ai(A[1]), .bi(B[1]^AddSub), .cini(C[0]), .si(Sum[1]), .couti(C[1]));
	//FullAdder S2(.ai(A[2]), .bi(B[2]^AddSub), .cini(C[1]), .si(Sum[2]), .couti(C[2]));
	//FullAdder S3(.ai(A[3]), .bi(B[3]^AddSub), .cini(C[2]), .si(Sum[3]), .couti(C[3]));
	//FullAdder S4(.ai(A[4]), .bi(B[4]^AddSub), .cini(C[3]), .si(Sum[4]), .couti(C[4]));
	//FullAdder S5(.ai(A[5]), .bi(B[5]^AddSub), .cini(C[4]), .si(Sum[5]), .couti(C[5]));
	//FullAdder S6(.ai(A[6]), .bi(B[6]^AddSub), .cini(C[5]), .si(Sum[6]), .couti(C[6]));
	//FullAdder S7(.ai(A[7]), .bi(B[7]^AddSub), .cini(C[6]), .si(Sum[7]), .couti(C[7]));
	
	assign OVR = C[7]^C[6];
	
endmodule


/*
module AdderSub #(parameter N=8)
(
	input [N-1:0] A,
	input [N-1:0] B,
	input AddSub,
	output reg OVR,
	output reg [N-1:0] Sum
);

always @(A or B or AddSub)
	if (AddSub==0) begin
		//{OVR, Sum} = A + B;
		Sum = A + B;
		//OVR = Sum[N-1]^Sum[N-2];
		if (A[N-1]==0 && B[N-1]==0 && Sum[N-1]==1)
			OVR = 1;
		else if (A[N-1]==1 && B[N-1]==1 && Sum[N-1]==0)
			OVR = 1;
		else
			OVR = 0;
	end
	
	else if (AddSub==1) begin
		//{OVR, sum} = A + (~B) + AddSub;
		Sum = A + (~B) + AddSub;
		if (A[N-1]==0 && B[N-1]==1 && Sum[N-1]==1)
			OVR = 1;
		else if (A[N-1]==1 && B[N-1]==0 && Sum[N-1]==0)
			OVR = 1;
		else
			OVR = 0;
	end
		
endmodule
*/
