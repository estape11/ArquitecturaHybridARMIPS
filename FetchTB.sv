module FetchTB();
	
	logic clk;
	logic PCsrc;
	logic [31:0] PCalu;
	logic [31:0] inst;
	
	Fetch fetch(clk, PCsrc, PCalu, inst);
	
	initial begin
		clk = 1;
		PCsrc = 0;
		PCalu = 0;
	end
	
	always begin
		#1
		clk = ~clk;
	end
	
endmodule