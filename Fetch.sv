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
              (input  logic clk, PCsrc,
		  		   input  logic [N-1:0] PCalu,
				   output logic [N-1:0] inst);
					
	logic [N-1:0] PCin, PCout, PCplus1;
	
	Register #(N) PC (PCin, ~clk, 1'b1, PCout);
	nBitsADD #(N) Sumador (PCout, 32'b1, 1'b0, PCplus1);
	InstructionMemory #(N) memoria_instrucciones(PCout, inst);
	
	assign PCin = (PCsrc)? PCalu : PCplus1;

endmodule