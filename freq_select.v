module freq_select(input clk,input [1:0] freq, output reg out_clk, output clk12);
	reg [12:0] cnt;
	reg temp;
	assign clk12 = temp;
	wire [12:0] cnt_times;
	assign cnt_times = (freq == 2'b11) ? 13'd400 : (freq == 2'b10) ? 13'd800 : (freq == 2'b01) ? 13'd1600 : 13'd3200;
	
	always@(posedge cnt[11])
		temp = ~temp;
	
	always @(posedge clk)begin
		if(cnt >= cnt_times) begin
			cnt <= 0;
			out_clk = ~out_clk;
		end
		else
			cnt <= cnt + 1;
	end
	

endmodule