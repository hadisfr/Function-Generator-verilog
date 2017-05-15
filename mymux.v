module mymux(input[7:0] func, sound, input sel, output [7:0] out);
	assign out = sel ? sound : func;
endmodule
