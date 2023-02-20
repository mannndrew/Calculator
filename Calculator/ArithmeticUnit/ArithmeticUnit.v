module ArithmeticUnit #(parameter N=8)
(
	input [N-1:0]in,
	input LoadA,
	input LoadB,
	input LoadR,
	input AddSub,
	input Reset,
	output [N-1:0]Result,
	output OVR
);

wire [N-1:0] AData;
wire [N-1:0] BData;
wire [N-1:0] RData;
wire [N-1:0] Sum;

assign Result = RData;

RegisterN #(N) registerA 
(
	.Clear(Reset),
	.Load(LoadA),
	.D(in),
	.Q(AData)
);

RegisterN #(N) registerB
(
	.Clear(Reset),
	.Load(LoadB),
	.D(in),
	.Q(BData)
);

AdderSub #(N) AdderSub0
(
	.A(AData),
	.B(BData),
	.AddSub(AddSub),
	.OVR(OVR),
	.Sum(Sum)
);

RegisterN #(N) registerR
(
	.Clear(Reset),
	.Load(LoadR),
	.D(Sum),
	.Q(RData)
);

endmodule
