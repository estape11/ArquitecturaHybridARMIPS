//Sumador completo de 1 bit
module fullAdder(input logic a,b,cin,
					  output logic out,cout);
	assign out = (a ^ b) ^ cin;
	assign cout = ( b & cin) | (a & b) | (a & cin);
endmodule

/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

					Sumador Completo
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 24/09/2018
	
	Entradas:- 2 operandos de entrada
				- Acarreo de entrada
				- Parametro N bits
				
	Restricciones:
				- Entradas son de N bits 
				- Acarreo de 1 bit
	
   Salidas: - Resultado de la suma de N bits
				- Bandera de overflow
				- Acarreo de salida
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module nBitsADD #(parameter N=32)
					  (input logic [N-1:0] a,b,
					   input logic cin,
					   output logic [N-1:0] out = 32'b0,
					   output logic overflow,cout);
	logic [N-1:0] carry; // para conectar los acarreos entre los comp. generados
   genvar i;
   generate 
		// for para generar los N componentes
		for(i=0;i<N;i=i+1)
			begin: generateNbitAdder
				if(i==0)
					fullAdder f(a[0],b[0],cin,out[0],carry[0]); 
				else
					fullAdder f(a[i],b[i],carry[i-1],out[i],carry[i]);
			end
   endgenerate
	assign cout = carry[N-1];
	assign overflow = carry[N-1] ^ carry[N-2]; // C_[n] == C_[n-1] ? produce overflow
endmodule 