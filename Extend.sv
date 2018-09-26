/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

				Extension de Inmediato
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- Inmediato
				- Señales de control ImmSrc y ImmExt
				
	Restricciones:
				- Inmediato de entrada debe ser de
				27 bits
	
   Salidas: - Inmediato extendido
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module Extend (input logic [26:0] imm,
					input logic ImmSrc, ImmExt,
					output logic [31:0] ExtImm);
	logic [31:0] ext14, ext27;
	assign ext14 = (ImmExt) ? { {18{ imm[13] }} , imm[13:0]} : { {18{ 1'b0 }} , imm[13:0]}; // ext de signo o de cero
	assign ext27 = (ImmExt) ? { {5{ imm[26] }} , imm} : { {5{ 1'b0 }} , imm }; // ext de signo o de cero
	assign ExtImm = (ImmSrc) ? ext27 : ext14;
endmodule 