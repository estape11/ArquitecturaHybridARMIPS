module Fetch(
	input clk,
	input PCsrc,
	input [31:0] PCalu,
	output wire [31:0] inst //instrucción
	);
	
	wire [31:0] pc_in;
	wire [31:0] pc_out;
	wire [31:0] PCsumador;
	
	assign pc_in = PCsrc ? PCalu : PCsumador;
	
	PCregister pc_register(clk, pc_in, pc_out);
	Sumador sumador(PCout, 1, PCsumador);
	Memory memeria_instrucciones(clk, 0, pc_out, 0, inst);
	
endmodule