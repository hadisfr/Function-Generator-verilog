module rom_counter(input clk, output [13:0] out);

	reg [13:0]cnt;
	always @(posedge clk)
		cnt <= cnt + 1;

endmodule
