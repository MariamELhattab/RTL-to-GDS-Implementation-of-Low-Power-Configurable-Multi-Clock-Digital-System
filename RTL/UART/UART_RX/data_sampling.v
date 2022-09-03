module data_sampling  (

input rst,
input clk,
input [4:0] prescaler,
input dat_sampling_en,
input [2:0] edge_cnt,
input  RX_IN,
output reg sampled_bit

);
reg[2:0] rx;
wire [3:0] half_edge,p_half_edge,n_half_edge;
assign half_edge = (prescaler>>1) -'b1;
assign p_half_edge = half_edge +'b1;
assign n_half_edge = half_edge -'b1;

always@(posedge clk or negedge rst)
begin
	if(!rst)
		begin
			sampled_bit<='b0;
		end
	else if(dat_sampling_en)
		begin
			if(edge_cnt == n_half_edge)
				begin
					rx[0]<=RX_IN;
				end
			else if(edge_cnt == half_edge)
				begin
					rx[1]<=RX_IN;
				end
			else if(edge_cnt == p_half_edge)
				begin
					rx[2]<=RX_IN;
				end
		end
	else
		begin
			rx<= 'b0;
		end
end
always@(posedge clk or negedge rst)
begin
	if(!rst) 
		begin
			sampled_bit<= 'b0;
		end
	else if(dat_sampling_en)
		begin
			sampled_bit<= (rx[0] & rx[1]) | (rx[2] & rx[1]) | (rx[0] & rx[2]);
		end
	else
		begin
			sampled_bit<= 'b0
		end
end
endmodule
