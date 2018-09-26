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
	
	Entradas:	-Tres direcciones de registros de N-bits
					-Dato a escribir en registro M-bits
					-PC M-bits
					-Reloj
					-Habilitador de escritura
					
				
	Restricciones:
				- Entradas son de N bits o M-bits
	
   Salidas: - Datos leidos
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
**********************************************************************
*/
module RegisterFile #(parameter N=4, M=32)
			(input logic clk,
			input logic WE3,
			input logic [N-1:0] A1,
			input logic [N-1:0] A2,
			input logic [N-1:0] A3,
			input logic [M-1:0] WD3,
			input logic [M-1:0] R15,
			output logic [M-1:0] RD1,
			output logic [M-1:0] RD2);
logic [31:0]rf[14:0];

always_ff@(posedge clk)
	if (WE3) rf[A3] <= WD3;
	
	assign RD1 = (A1==4'b1111)? R15:rf[A1];
	assign RD2 = (A1==4'b1111)? R15:rf[A2];
endmodule
