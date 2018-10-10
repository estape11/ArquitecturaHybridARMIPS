module ArquitecturaHybridARMIPS_tb();
	logic clk, halt, reset;
	logic [31:0] inst;
	ArquitecturaHybridARMIPS DUT (clk, reset, halt, inst);
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