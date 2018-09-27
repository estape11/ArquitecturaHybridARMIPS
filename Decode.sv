/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

					Etapa Decode
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 27/09/2018
	
	Entradas:- Instruccion
				- PC
				- Dato a escribir en banco de 
				registros
				- Direccion de Rd
				- Clk
				- Señal de control
				- Parametro N bits
				
	Restricciones:
				- Instruccion de N bits
				
   Salidas: - Señales de control
				- Valor del registro a y b
				- Direccion de Rd
				- Resultado de la extension de signo
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module Decode #(parameter N=32)
					(input logic [N-1:0] inst, PC, DataWrite,
					 input logic [3:0] Rd,
					 input logic clk, RegWrite,
					 output logic [N-1:0] Ra, Rb, ExtImm,
					 output logic [3:0] RdOut,
					 output logic MemPWrite, RegWriteOut, MemWrite, BranchInst, ALUSrc, FlagWrite, PAUOp, IOFlag, ResultSrc,
					 output logic [3:0] ALUControl,
					 output logic [2:0] CondFlag,
					 output logic [1:0] MemToReg);
	logic RnSrc, ImmSrc, RsSrc, ImmExt;
	logic [3:0] A1, A2;
	logic [26:0] ImmMux;
	
	ControlUnit UnidadControl (inst[31:22], RnSrc, ImmSrc, RsSrc, ResultSrc, IOFlag, PAUOp, ImmExt, FlagWrite, ALUSrc, 
										BranchInst, MemWrite, RegWriteOut, MemPWrite, ALUControl, CondFlag, MemToReg);
	RegisterFile #(4, N) BancoRegistro (clk, RegWrite, A1, A2, Rd,	DataWrite, PC, Ra, Rb);
	Extend Extension (ImmMux, ImmSrc, ImmExt, ExtImm);
	
	assign ImmMux = (ImmSrc) ? inst[26:0] : { {13{1'b0}},inst[13:0]};
	assign A1 = (RnSrc) ? inst[17:14] : inst[21:18];
	assign A2 = (RsSrc) ? inst[17:14] : inst[13:10];
	assign RdOut = inst[17:14];
endmodule 