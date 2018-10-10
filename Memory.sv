/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						Memory
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- 4 operandos de entrada
				- clock
				- Dirección de almacenamiento/lectura del dato
				- Dato a escribir
				- Dato leido
				
	Restricciones:
				- Entradas son de N bits 
	
   Salidas: - Dato leido
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
*/
module Memory #(parameter N = 32, M=94500)
					(input  logic clk, wr,
					 input  logic [N-1:0] address, data_in,
					 output logic [N-1:0] data_out);

	logic [N-1:0] mem [M];
	initial begin
		$readmemb("ram.mem", mem); // cambiar ruta de cada uno
	end
	always_ff @(negedge clk) begin
		if (wr == 1)
			mem[address] <= data_in;	
	end
	
	always_ff @(posedge clk) begin
		if (wr == 0)
			data_out <= mem[address];
	end
	
endmodule