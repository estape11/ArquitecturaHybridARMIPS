module PixelMemory_tb();
	logic clk, enable;
	logic [31:0] address, data_in, data_out;
	PixelMemory #(32) DUT
					(clk, enable,
					 address, data_in,
					 data_out);
	initial begin
		clk=1'b1;
		address = 32'b1010000000000000111;
		enable=0;
	end
	always begin
		#1
		clk=~clk;
	end
endmodule 