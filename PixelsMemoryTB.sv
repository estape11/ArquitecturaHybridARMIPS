module PixelsMemoryTB();
	
	logic clk;
	logic wr;
	logic [31:0] address_ij;
	logic [31:0] data_in;
	logic [31:0] data_out;
	
	PixelsMemory memoria(clk, wr, address_ij, data_in, data_out);
	
	always begin
		#1
		clk = ~clk;
	end
	
	initial begin
		clk = 1;
		data_in = 32'b1;
		address_ij = 32'b00000000000000100000000000000001;
		wr = 1;
		
		#3
		wr = 0;
	end
endmodule