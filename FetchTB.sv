module FetchTB();
	
	logic clk;
	logic PCsrc;
	logic PCalu;
	wire inst;
	
	Fetch fetch(clk, PCsrc, PCalu, inst);
	
	initial begin
		
	end
endmodule