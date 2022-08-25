`timescale 100ns / 100ns
module RegFile_tb#(parameter DATAWIDTH=8,DEPTH = 16, ADDR = 4);
reg CLK;
reg RST;
reg [ADDR-1:0] Address;
reg WrEn;
reg RdEn;
reg [DATAWIDTH-1:0]  WrData;
wire [DATAWIDTH-1:0] RdData;
wire RdData_Valid;
wire [DATAWIDTH-1:0] REG0;
wire [DATAWIDTH-1:0] REG1;
wire [DATAWIDTH-1:0] REG2;
wire [DATAWIDTH-1:0] REG3;

RegFile DUT(
.CLK(CLK),
.RST(RST),
.Address(Address),
.WrEn(WrEn),
.RdEn(RdEn),
.WrData(WrData),
.RdData(RdData),
.RdData_Valid(RdData_Valid),
.REG0(REG0),
.REG1(REG1),
.REG2(REG2),
.REG3(REG3)
);

initial begin
CLK = 1'b0;
forever #25 CLK =~ CLK;
end
initial begin
   RST = 1'b0;
#50
RST =1'b1;
#50
WrEn = 1;
RdEn =0;
WrData = 'b10001000;
Address = 'b1010;
#50
WrEn =0;
#50
WrEn = 1;
WrData = 'b10001011;
Address = 'b1111;
RdEn =0;
#50
WrEn =0;
#50
RdEn = 1;
Address = 'b1010;
#50
RdEn =0;
#50
RdEn = 1;
Address = 'b1111;

end

endmodule