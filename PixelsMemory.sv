/**
**********************************************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						PixelsMemory
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- 4 operandos de entrada
				- clock
				- Bandera de lectura/escritura  1->escritura 0->lectura
				- Dirección de lectura/escritura LSB -> i  MSB -> j
				- Datos de escritura, solamente el LSB se toma en cuenta
				
	Restricciones:
				- Entradas son de N bits 
	
   Salidas: - Dato leido
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
**********************************************************************
*/
module PixelsMemory #(parameter N = 32)
							(input  logic clk, wr,
							 input  logic [N-1:0] address_ij, data_in,
							 output logic [N-1:0] data_out);
	
	logic mem[350][270];
	logic [N/2:0] i;
	logic [N/2:0] j;
	logic pix_out = 0;
	logic pix_in;
	
	always_ff @(negedge clk) begin
		if (wr == 1)
			mem[i][j] <= pix_in;	
	end
	
	always_ff @(posedge clk) begin
		if (wr == 0)
			pix_out <= mem[i][j];
	end
	
	assign i = address_ij[N/2-1:0];
	assign j = address_ij[N-1:N/2];
	
	assign pix_in = data_in[0];
	assign data_out = { {N-1{ 1'b0 }} , pix_out};
endmodule