/**
**********************************************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						Fetch
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- 3 operandos de entrada
				- clock
				- Fuente para leer pec
				- PC proveniente de la ALU
				
	Restricciones:
				- Entradas son de N bits 
	
   Salidas: - instrucción leida
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
**********************************************************************
*/
module Fetch #(parameter N = 32)
              (input  clk, PCsrc,
					input  [N-1:0] PCalu,
					output [N-1:0] inst);
	
	logic [N-1:0] pc = 0;
	logic [N-1:0] PCsumador;
	
	Sumador sumador(pc, 1, PCsumador);
	InstructionMemory memoria_instrucciones(pc, inst);
	
	always_ff @(posedge clk)
		pc = PCsrc ? PCalu : PCsumador;
	
endmodule