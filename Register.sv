/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

					Registro Basico
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 24/09/2018
	
	Entradas:- Valor de N bits
				- Reloj
				- Parametro N bits
				
	Restricciones:
				- Entrada debe ser de N bits
	
   Salidas: - Cuando pasa al semiciclo positivo
				la entrada pasa a la salida

            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module Register #(parameter N=32)
					  (input logic [N-1:0] in,
						input logic clk,
						output logic [N-1:0] out);
	always_ff @ (posedge clk) begin
		out<=in;
	end	
endmodule 