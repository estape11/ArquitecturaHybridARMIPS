/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

				Calculador de Promedio
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 24/09/2018
	
	Entradas:- Pixel por operar
				- Parametro N bits
				
	Restricciones:
				- Pixel esta compuesto de RGB
				cada uno de 8 bits (24 bits).
	
   Salidas: - Resultado calcular el promedio
				del pixel de entrada
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module AverageUnit #(parameter N=32)
						  (input logic [N-1:0] pixel,
							output logic [N-1:0] out);
	//assign out = (pixel[7:0]+pixel[15:8]+pixel[23:16])/2'b11;
	logic [9:0] outADD1, outADD2, etapa1, etapa2, etapa3;
	nBitsADD #(10) ADD1 ({2'b0,pixel[7:0]},{2'b0,pixel[15:8]},1'b0,outADD1);
	nBitsADD #(10) ADD2 ({2'b0,pixel[23:16]}, outADD1, 1'b0, outADD2);
	
	nBitsADD #(10) ADD3 (outADD2, outADD2>>2'b10, 1'b0, etapa1);
	nBitsADD #(10) ADD4 (etapa1, etapa1>>3'b100, 1'b0, etapa2);
	nBitsADD #(10) ADD5 (etapa2, etapa2>>4'b1000, 1'b0, etapa3);
	assign out = etapa3>>2'b10;
endmodule 