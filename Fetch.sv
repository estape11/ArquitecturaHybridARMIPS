/*WARNING******************************
Se debe iginorar el primer ciclo
para evitar que la primera instrucción
se ejecute dos veces.
***************************************/

module Fetch(
	input clk,
	input PCsrc,
	input [31:0] PCalu,
	output [31:0] inst //instrucción
	);
	
	logic [31:0] pc = 0;
	logic [31:0] PCsumador;
	
	Sumador sumador(pc, 1, PCsumador);
	InstructionMemory memoria_instrucciones(pc, inst);
	
	always_ff @(posedge clk) begin
		if (PCsrc)
			pc = PCalu;
		else
			pc = PCsumador;
	end
endmodule