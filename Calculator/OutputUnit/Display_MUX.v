module Display_MUX
(
	input [2:0] count,
	input [43:0] BCD_In,
	output reg [23:0] BCD_Out
);

always @(count, BCD_In)
	case (count)
		3'b000:	BCD_Out[23:0] <= BCD_In[23:0];
		3'b001:	BCD_Out[23:0] <= BCD_In[27:4];
		3'b010:	BCD_Out[23:0] <= BCD_In[31:8];
		3'b011:	BCD_Out[23:0] <= BCD_In[35:12];
		3'b100:	BCD_Out[23:0] <= BCD_In[39:16];
		3'b101:	BCD_Out[23:0] <= BCD_In[43:20];
		default:	BCD_Out[23:0] <= BCD_In[23:0];
	endcase
endmodule
