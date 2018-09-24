/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						PAU
			[Pixels Arithmetic Unit]
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 24/09/2018
	
	Entradas:- Pixel por operar
				- Selector de operacion
				- Valor de umbral
				- Parametro N bits
				
	Restricciones:
				- Entradas son de N bits
				- Señal de control de 1 bit
	
   Salidas: - Resultado de la operacion de 
				N bits
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module PAU #(parameter N=32)
				(input logic [N-1:0] pix, umbral,
				 input logic sel,
				 output logic [N-1:0] out);
	logic [N-1:0] outProm, outUmb;
	AverageUnit #(N) Prom (pix, outProm);
	UmbralUnit #(N) Umb (pix, umbral, outUmb);
	assign out = (sel)?  {N{outUmb}} : outProm; // es por que umbral solo saca 1 bit
endmodule 