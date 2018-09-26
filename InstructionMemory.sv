/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						PixelsMemory
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- 1 operando de entrada
				- Dirección de lectura
				
	Restricciones:
				- Entradas son de N bits 
	
   Salidas: - Dato leido
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
*/
module InstructionMemory #(parameter N = 32) 
								  (input  logic [N-1:0] address,
									output logic [N-1:0] data_out);
	
	logic [N-1:0] mem [100];
	
	assign data_out = mem[address];
endmodule