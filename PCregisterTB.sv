module PCregisterTB();
	logic clk;
	logic [31:0] pc_int;
	wire  [31:0] pc_out;
	
	PCregister pc(clk, pc_in, pc_out);
	
	always begin
		#1
		clk = ~clk;
	end
	
	initial begin
		clk = 1;
		pc_in = 1;
		#3
		pc_in = 2;
	end
endmodule