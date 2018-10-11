//Multiplexor de 16 entradas de N bits cada una, y selector de 4 bits
module mux4 #(parameter N=32)
				 (input logic [N-1:0]in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15,
				  input logic [3:0] sel,
				  output logic [N-1:0]out);
	
	// abstraccion del multiplexor en SystemVerilog (comparadores)
	assign out=(sel == 4'b0)? in0 : (sel == 4'b1)? in1 : (sel == 4'b10)? in2 : (sel == 4'b11)? in3 :
				  (sel == 4'b100)? in4 : (sel == 4'b101)? in5 : (sel == 4'b110)? in6 : (sel == 4'b111)? in7 :
				  (sel == 4'b1000)? in8 : (sel == 4'b1001)? in9 : (sel == 4'b1010)? in10 : (sel == 4'b1011)? in11 :
				  (sel == 4'b1100)? in12 : (sel == 4'b1101)? in13 : (sel == 4'b1110)? in14 : in15;				
endmodule

//AND de N bits
module nBitsAND #(parameter N=32)
					  (input logic [N-1:0]a,b,
						output logic [N-1:0]out);
	assign out = a & b;
endmodule 

//OR de N bits
module nBitsOR #(parameter N=32)
					 (input logic [N-1:0]a,b,
					  output logic [N-1:0]out);
	assign out = a | b;
endmodule 

//NOT de N bits
module nBitsNOT #(parameter N=32)
					  (input logic [N-1:0]a,
						output logic [N-1:0]out);
	assign out = ~a;
endmodule 

//Complemento a dos de N bits
module nBitsC2 #(parameter N=32)
					 (input logic [N-1:0]a,
					  output logic [N-1:0]out);
	assign out = (~a) + 1'b1;
endmodule 

//Shift de N bits
module nBitsShift	#(parameter N=32)
						 (input logic [N-1:0] a,
						  input logic [N-1:0]shamt,
						  input logic sel, //0 der, 1 izq
						  output logic [N-1:0] out);
	logic [N-1:0] outIzq, outDer;
	assign outDer = a<<shamt;		
	assign outIzq = a>>shamt;
	assign out = (sel == 1'b0) ? outDer : outIzq;
endmodule

/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

						ALU
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 24/09/2018
	
	Entradas:- 2 operandos de entrada
				- Selector de operacion
				- Parametro N bits
				
	Restricciones:
				- Entradas son de N bits 
				- Señal de control de 4 bits
	
   Salidas: - Resultado de la operacion de 
				N bits
				- Banderas de Zero, Negativo y
				overflow
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module ALU #(parameter N=32)
				(input logic [N-1:0] a, b,
				 input logic [3:0] sel,
				 output logic z, n, v, // banderas zero, negativo, overflow
				 output logic [N-1:0] result);
	logic [N-1:0] outAND, outOR, outADD, selB, outC2, outShift, nLO, nHI, Ra, Rb;
	logic HI, LO, selShift, cout; 
	assign HI = 1'b1;
	assign LO = 1'b0;
	assign nLO = {N{LO}};
	assign nHI = {N{HI}};
	assign selShift = (sel == 4'b11) ? HI : LO; // shift left o right
	assign selB = (sel == 4'b1) ? Rb : outC2; // resta o suma
	assign n = result[N-1];
	assign z = (result == nLO) ? 1'b1 : 1'b0;
	assign Ra = (sel != 4'b1001)? a : b;
	assign Rb = (sel != 4'b1001)? b : a;
	nBitsAND #(N) AND (Ra, Rb, outAND);
	nBitsADD #(N) ADD (Ra, selB, LO, outADD, v, cout);
	nBitsOR #(N) OR (Ra, Rb, outOR);
	nBitsC2 #(N) C2 (Rb, outC2);
	nBitsShift #(N) SHIFT (Ra, Rb, selShift, outShift);
	mux4 #(N) MUX (nLO, outADD, outADD, outShift, outShift, outAND, outOR, Rb, Ra, outADD, nHI, nHI, nHI, nHI, nHI, nHI,
						sel, result);
	
endmodule
