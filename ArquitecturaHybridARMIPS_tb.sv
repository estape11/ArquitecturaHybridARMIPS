module ArquitecturaHybridARMIPS_tb();
	logic clk, halt, reset;
	ArquitecturaHybridARMIPS DUT (clk, reset, halt);
	initial begin
		halt=1'b0;
		reset=1'b0;
		clk=1'b1;
	end
	always begin
		#1
		clk=~clk;
	end
endmodule 