module ampl_select(input [7:0] in, input [1:0] amp, output [7:0] out);

	assign out = in >> amp;
	
endmodule