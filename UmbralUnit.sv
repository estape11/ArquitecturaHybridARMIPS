/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

				Calculador de Umbral
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 24/09/2018
	
	Entradas:- Pixel por operar
				- Valor de umbral
				- Parametro N bits
				
	Restricciones:
				- Pixel es de 8 bits
	
   Salidas: - Resultado de umbralizar
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module UmbralUnit #(parameter N=32)
						 (input logic [N-1:0] pixel,
						  input logic [N-1:0] umbral,
						  output logic  out);
	assign out = (pixel[7:0]>=umbral)? 1 : 0;
endmodule 