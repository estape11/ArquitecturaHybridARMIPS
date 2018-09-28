module ArquitecturaHybridARMIPS_tb();
	logic clk, halt, reset;
	ArquitecturaHybridARMIPS DUT (clk, reset, halt);
	initial begin
		clk=1'b1;
	end
	always begin
		#1
		clk=~clk;
	end
endmodule 