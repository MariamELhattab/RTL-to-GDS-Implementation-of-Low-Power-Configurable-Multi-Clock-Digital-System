module RegFile#(parameter DATAWIDTH=8,DEPTH = 16, ADDR = 4  ) 

(
input wire CLK,
input wire RST,
input wire [ADDR-1:0] Address,
input wire WrEn,
input wire RdEn,
input wire [DATAWIDTH-1:0]  WrData,
output reg [DATAWIDTH-1:0] RdData,
output reg RdData_Valid,
output wire[DATAWIDTH-1:0] REG0,
output wire[DATAWIDTH-1:0] REG1,
output wire[DATAWIDTH-1:0] REG2,
output wire[DATAWIDTH-1:0] REG3
);
reg [DATAWIDTH-1:0] RegArray [DEPTH-1:0];
integer I;
always@(posedge CLK or negedge RST)
begin
if(!RST) begin
 RdData<= 'b0;
  RdData_Valid <= 'b0; 
 for(I=0;I<DEPTH;I=I+1) 
 begin
  if(I==2)
 RegArray[I]<= 'b001000_01 ;
  else if(I ==3)
 RegArray[I] <= 'b0000_1000 ; 
  else 
RegArray[I] <= 'b0; 
  end
end
else if(WrEn & !RdEn) begin RegArray[Address]<= WrData; end
else if(!WrEn & RdEn) 
begin 
RdData<= RegArray[Address]; 
RdData_Valid <= 'b1; 
end
else begin RdData_Valid <= 'b0; end
end
assign REG0 = RegArray[0];
assign REG1 = RegArray[1];
assign REG2 = RegArray[2];
assign REG3 = RegArray[3];
endmodule