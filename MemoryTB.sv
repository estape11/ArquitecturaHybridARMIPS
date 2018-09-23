module MemoryTB();
	
	logic clk;
	logic wr;
	logic [31:0] address;
	logic [31:0] data_in;
	logic [63:0] data_out;
	
   Memory DUT (clk, wr, address, data_in, data_out);
		
	always begin
		#1
		clk = ~clk;
	end

   initial begin
		   clk = 1; 
			
			wr = 1;
			address = 0;
			data_in = 100;
			#4
			address = 1;
			data_in = 2;
			#4
			address = 1;
			wr = 0;
	end
endmodule