module ArithmeticUnit #(parameter N=32)
(
	input [N-1:0]in,
	input LoadA,
	input LoadB,
	input LoadR,
	input [2:0] op,
	input Reset,
	output [N-1:0]Result
);

wire [N-1:0] AData;
wire [N-1:0] BData;
wire [N-1:0] RData_CLA;
wire [N-1:0] RData_MUL;
wire [N-1:0] RData_DIV;
wire [N-1:0] RData_SFT;
wire [N-1:0] Out_D;
wire [N-1:0] Out_Q;

wire AddSub, Left_Right, Logic_Arithmetic;

assign Result = Out_D;

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

OpMux OpcodeSelector
(
	.op(op),
	.AddSub(AddSub),
	.Left_Right(Left_Right),
	.Logic_Arithmetic(Logic_Arithmetic)
);

CarryLookAhead #(N) AdderSub
(
	.A(AData),
	.B(BData),
	.cin(AddSub),
	.Sum(RData_CLA)
);

ArrayMultiplier #(N) Multiplier
(
	.A(AData),
	.B(BData),
	.Z(RData_MUL)
);

ArrayDivider #(N) Divider
(
	.Dividend(AData),
	.Divisor(BData),
	.Quotient(RData_DIV)
);

BarrelShifter #(N) Shifter
(
	.Input(AData),
	.Shift_Val(BData),
	.Left_Right(Left_Right),
	.Logic_Arithmetic(Logic_Arithmetic),
	.Result(RData_SFT)
);

OutMux #(N) DataOutMux
(
	.op(op),
	.Add(RData_CLA),
	.Multiply(RData_MUL),
	.Divide(RData_DIV),
	.Shift(RData_SFT),
	.Out(Out_D)
);

RegisterN #(N) registerR
(
	.Clear(Reset),
	.Load(LoadR),
	.D(Out_D),
	.Q(Out_Q)
);

endmodule
