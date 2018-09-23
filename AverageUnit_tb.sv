module AverageUnit_tb();
	logic [31:0] in, out;
	AverageUnit #(32) DUT (in,out);
	initial begin
		in=32'b111111111100100001100100;
	end
endmodule 