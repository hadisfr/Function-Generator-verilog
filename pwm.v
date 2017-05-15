module pwm(input [7:0] in, input clk, output out);

reg [7:0] count;
always @(posedge clk) count <= count +1;

assign out = (count < in) ? 1 : 0;

endmodule
