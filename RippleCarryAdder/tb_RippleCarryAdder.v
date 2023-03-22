`timescale 1ns/100ps

module tb_RippleCarryAdder #(parameter N = 8);

	integer i;
	reg [N-1:0] A;
	reg [N-1:0] B;
	reg cin;
	wire [N-1:0] Sum;



	RippleCarryAdder RCA0
	(
		.A(A),
		.B(B),
		.cin(cin),
		.Sum(Sum)
	);
	
	

	initial begin
		A <= 0;
		B <= 0;
		cin <= 0;

		$monitor ("a=%-5d b=%-5d cin=%-5d sum=%-5d", A, B, cin, Sum);

			for (i =0; i<100; i=i+1) begin 
				#1
				A <= $random;
				B <= $random;
				cin <= $random;
			end

	end
	
endmodule



