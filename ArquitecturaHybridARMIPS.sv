/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

					HybridARMIPS
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 27/09/2018
	
	Entradas:- Clk
				- reset
				- halt
				
	Restricciones:
				-
	
   Salidas: - Ejecucion de las instrucciones
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module ArquitecturaHybridARMIPS(input logic clk, reset, halt); // halt para detener la ejecucion
	logic enable;
	logic [31:0] outFE, inDE, PC, DataWrite, PCalu, IOIn;
	logic [3:0] Rd;
	logic PCSrc, RegWrite;
	logic [117:0] outDE, inEXE;
	logic [74:0] outEXE, inMEM;
	logic [104:0] outMEM, inWB;
	assign enable = ~halt & 1'b1;
	assign IOIn = 32'b0;
	Fetch #(32) IF (clk, PCSrc,
		  		   PCalu,
				   outFE, PC);
					
	Decode #(32) DE (inDE, PC, DataWrite,
					 Rd,
					 clk, RegWrite,
					 outDE[95:64], outDE[63:32], outDE[31:0], // Ra, Rb, ExtImm
					 outDE[99:96], // Rd
					 outDE[100], outDE[101], outDE[102], outDE[103], outDE[104], // MemPWrite, RegWriteOut, MemWrite, BranchInst, ALUSrc
					 outDE[105], outDE[106], outDE[107], outDE[108],  // FlagWrite, PAUOp, IOFlag, ResultSrc
					 outDE[112:109], // ALUControl
					 outDE[115:113], // CondFlag
					 outDE[117:116]); // MemToReg

	Execute #(32) EXE (inEXE[100], inEXE[101], inEXE[102], inEXE[103], inEXE[104], // MemPWrite, RegWrite, MemWrite, BranchInst, ALUSrc 
					  inEXE[105], inEXE[106], inEXE[107], inEXE[108], // FlagWrite, PAUOp, IOFlag, ResultSrc
					  clk,
					  inEXE[117:116], // MemToReg
					  inEXE[112:109], // ALUControl
					  inEXE[115:113], // CondFlag
					  inEXE[95:64], inEXE[63:32], inEXE[31:0], // Ra, Rb, ExtIm
					  inEXE[99:96], // Rd
					  outEXE[70], outEXE[71], outEXE[72], outEXE[73], outEXE[74], // PCSrc, RegWriteOut, MemWriteOut, MemPWriteOut, IOFlagOut
					  outEXE[69:68], // MemToRegOut
					  outEXE[31:0], outEXE[63:32], // ALUResult, WriteData
					  outEXE[67:64]); // RdOut);
					  
	MemoryStage #(32) MEM (clk,
							inMEM[72], inMEM[73], inMEM[70], inMEM[71], inMEM[74], // MEMWrite, MemPWrite, PCSrc, RegWrite, IOFlag
							inMEM[69:68], // MemToReg
							inMEM[31:0], inMEM[63:32], // address, WriteData
							inMEM[67:64], // RdIn,
							outMEM[31:0], outMEM[63:32], outMEM[95:64], // ReadDataDataMem, ReadDataPixMem, ALUresultOut
							outMEM[99:96], // RdOut
							outMEM[102], outMEM[103], outMEM[104], // PCSrcOut, RegWriteOut, IOFlagOut
							outMEM[101:100]); // MemToRegOut 
							
	WriteBack #(32) WB (inWB[102], inWB[103], inWB[104], // PCSrc, RegWrite, IOFlag
						 inWB[101:100], // MemToReg
						 IOIn, inWB[31:0], inWB[63:32], inWB[95:64], // IOIn, ReadData, ReadDataP, ALUOut,
						 inWB[99:96], // Rd
						 DataWrite, 
						 Rd,
						 PCSrc, RegWrite);
						 
	Register #(32) IF_DE (outFE, ~clk, enable, inDE);
	Register #(118) DE_EXE (outDE, ~clk, enable, inEXE);
	Register #(75) EXE_MEM (outEXE, ~clk, enable, inMEM);
	Register #(105) MEM_WB (outMEM, ~clk, enable, inWB);
endmodule 