module ArquitecturaHybridARMIPS_tb();
	logic clk, halt, reset;
	logic [31:0] inst, DecoVisu, ExeVisu, MemVisu, MemPixVisu, WBVisu;
	ArquitecturaHybridARMIPS DUT (clk, reset, halt, inst, DecoVisu, ExeVisu, MemVisu, MemPixVisu, WBVisu);
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