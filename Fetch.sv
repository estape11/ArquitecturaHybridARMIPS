module Fetch(
	input clk,
	input PCsrc,
	input [31:0] PCalu,
	output [31:0] inst //instrucción
	);
	
	logic [31:0] pc;
	logic [31:0] PCsumador;
	
	Sumador sumador(pc, 1, PCsumador);
	Memory memeria_instrucciones(clk, 0, pc, 0, inst);
	
	always_ff @(posedge clk) begin
		if (PCsrc)
			pc = PCalu;
		else
			pc = PCsumador;
	end
endmodule