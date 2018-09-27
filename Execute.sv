/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

					Etapa Execute
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 26/09/2018
	
	Entradas:- Señales de control
				- Operandos Ra y Rb
				- Direccion de Rd
				
	Restricciones:
				- Verificar las señales de control
	
   Salidas: - Señales de control
				- Resultado de la exe
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module Execute #(parameter N=32)
					(input logic MemPWrite, RegWrite, MemWrite, BranchInst, ALUSrc, FlagWrite, PAUOp, IOFlag, ResultSrc, clk,
					 input logic [1:0] MemToReg,
					 input logic [3:0] ALUControl,
					 input logic [2:0] CondFlag,
					 input logic [31:0] Ra, Rb, ExtIm,
					 input logic [3:0] Rd,
					 output logic PCSrc, RegWriteOut, MemWriteOut, MemPWriteOut, IOFlagOut,
					 output logic [1:0] MemToRegOut,
					 output logic [N-1:0] ALUResult, WriteData, 
					 output logic [3:0] RdOut);
	logic z, v, n;
	logic [31:0] ALUOut, APUout, RbMux;
	assign MemPWriteOut = MemPWrite;
	assign RegWriteOut = RegWrite;
	assign MemToRegOut = MemToReg;
	assign MemWriteOut = MemWrite;
	assign IOFlagOut = IOFlag;
	assign RdOut = Rd;
	assign WriteData = Rb;
	ConditionalUnit UniCondicion (z, v, n, FlagWrite, BranchInst, clk, CondFlag, PCSrc);
	ALU #(32) ALUnit (Ra, RbMux, ALUControl, z, n, v, ALUOut);
	PAU #(32) PAUnit (Ra, Rb,PAUOp, APUout);
	assign RbMux = (ALUSrc) ? ExtIm : Rb;
	assign ALUResult = (ResultSrc) ? APUout : ALUOut;
endmodule 