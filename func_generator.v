module func_generator(input [2:0] func, input clk, input rst, output reg [7:0] out);

wire [7:0] square, sawtooth, triangle, rhomboid, sine;

//counter
reg [7:0] cnt;
wire co;

assign co = (cnt == 8'd255);
reg signed [15:0] sin,cos;
wire [15:0]temp;
assign temp = sin + { {6{cos[15]}},cos[15:6]};

always@(posedge clk)
	cnt <= cnt + 1;

always @(posedge clk, posedge rst) begin 
	if (rst) begin
		sin <= 16'd0;
		cos <= 16'd30000;
	end
	else begin
		sin <= temp;
		cos <= cos - { {6{temp[15]}},temp[15:6]};
	end
end

always @(func) case(func)
	3'b000: out = rhomboid;
	3'b001: out = sine;
	3'b010: out = square;
	3'b011: out = triangle;
	3'b100: out = sawtooth;
	//3'b101: out = arbitrary; 
	default: out = 8'd128;
endcase




assign square = (cnt < 8'd128)? 8'd255 : 8'b0;
assign sawtooth = cnt;
assign triangle = cnt < 8'd128 ? cnt : 8'd256 - cnt;
assign rhomboid = cnt[0] ? triangle : -triangle;
assign sine = sin[15:8] + 8'd128;

	

endmodule
