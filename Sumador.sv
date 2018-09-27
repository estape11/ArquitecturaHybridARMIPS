/**
**********************************************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						Sumador
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- 2 operandos de entrada
				
	Restricciones:
				- Entradas son de N bits 
	
   Salidas: - Dato leido
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
**********************************************************************
*/
module Sumador(input [31:0]sumando1,
		         input [31:0]sumando2,
		         output logic [31:0]resultado);
	
	//logic [31:0]resul = 0;
	
	assign resultado = sumando1 + sumando2;
	
	
	//assign resultado = resul;
endmodule