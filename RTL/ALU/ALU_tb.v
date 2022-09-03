`timescale 100ns / 100ns
module ALU_tb#(parameter DATAWIDTH=8,FUNC=4);
reg										CLK;
reg 									RST;
reg		[DATAWIDTH-1:0] 				A;
reg		[DATAWIDTH-1:0]					B;
reg		[FUNC-1:0]						ALU_FUNC;
reg										Enable;
output reg		[2*DATAWIDTH-1:0]		ALU_OUT;
output reg								OUT_VALID;

ALU DUT(
.CLK(CLK),
.RST(RST),
.A(A),
.B(B),
.ALU_FUNC(ALU_FUNC),
.Enable(Enable),
.ALU_OUT(ALU_OUT),
.OUT_VALID(OUT_VALID)

);