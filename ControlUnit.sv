/**
***********************************************
		Instituto Tecnologico de Costa Rica 
			Ingenieria en Electronica

					Unidad de Control
       
		Autores: Esteban Aguero Perez
					Michael Gonzalez Rivera
					Daniela Hernandez Alvarado
					
			Lenguaje: SystemVerilog
					Version: 1.0         
		Ultima Modificacion: 27/09/2018
	
	Entradas:- Cabecera de instruccion
				
	Restricciones:
				- La cabecera debe ser de 10 bits
	
   Salidas: - Señales de control
            
		Arquitectura de Computadores I 2018
				Prof. Ronald Garcia
***********************************************
**/
module ControlUnit(input logic [9:0] InstHeader,
						 output logic RnSrc, ImmSrc, RsSrc, ResultSrc, IOFlag, PAUOp, ImmExt, FlagWrite, ALUSrc, BranchInst, MemWrite, RegWrite, MemPWrite,
						 output logic [3:0] ALUControl,
						 output logic [2:0] CondFlag,
						 output logic [1:0] MemToReg);
	always_comb begin
		if (InstHeader[6:5] == 2'b0) begin // Inst de datos
			if (InstHeader[4]) begin // si es con inmediato
				if(InstHeader[3:0] == 4'b1) begin // SUB
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b1;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b1;
					BranchInst<=1'b0;
					ALUControl<=4'b10;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b1;
				end
				else if(InstHeader[3:0] == 4'b10) begin // ADD
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b1;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b1;
					BranchInst<=1'b0;
					ALUControl<=4'b1;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b1;
				end
				else if(InstHeader[3:0] == 4'b0011) begin// MOV
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b1;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b1;
					BranchInst<=1'b0;
					ALUControl<=4'b0111;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b01;
				end
				else if(InstHeader[3:0] == 4'b0111) begin// CMP
					RnSrc<=1'b1;
					ImmSrc<=1'b0;
					ImmExt<=1'b1;
					RegWrite<=1'b0;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b1;
					BranchInst<=1'b0;
					ALUControl<=4'b0010;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b01;
				end
				else begin// NOP por defecto
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b0;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b0;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b0;
				end
			end
			else begin // sin inmediato
				if(InstHeader[3:0] == 4'b1) begin // SUB
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b10;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b1;
				end
				else if(InstHeader[3:0] == 4'b10) begin // ADD
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b1;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b1;
				end
				else if (InstHeader[3:0] == 4'b111) begin // CMP
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b0;
					RsSrc<=1'b1;
					PAUOp<=1'b0;
					FlagWrite<=1'b1;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b10;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b0;
				end
				else if (InstHeader[3:0] == 4'b1010) begin // AVR
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b0;
					CondFlag<=3'b0;
					ResultSrc<=1'b1;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b1;
				end
				else if (InstHeader[3:0] == 4'b1011) begin // CUM
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b1;
					RsSrc<=1'b0;
					PAUOp<=1'b1;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b0;
					CondFlag<=3'b0;
					ResultSrc<=1'b1;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b1;
				end
				else if (InstHeader[3:0] == 4'b0011) begin // move
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b1;
					RsSrc<=1'b1;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b1000;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b01;
				end
				else begin // NOP por defecto
					RnSrc<=1'b0;
					ImmSrc<=1'b0;
					ImmExt<=1'b0;
					RegWrite<=1'b0;
					RsSrc<=1'b0;
					PAUOp<=1'b0;
					FlagWrite<=1'b0;
					ALUSrc<=1'b0;
					BranchInst<=1'b0;
					ALUControl<=4'b0;
					CondFlag<=3'b0;
					ResultSrc<=1'b0;
					MemWrite<=1'b0;
					MemPWrite<=1'b0;
					IOFlag<=1'b0;
					MemToReg<=2'b0;
				end
			end
		end
		else if(InstHeader[6:5] == 2'b1) begin // Inst de memoria
			if (InstHeader[4:3] == 2'b0) begin // STR
				RnSrc<=1'b0;
				ImmSrc<=1'b0;
				ImmExt<=1'b1;
				RegWrite<=1'b0;
				RsSrc<=1'b1;
				PAUOp<=1'b0;
				FlagWrite<=1'b0;
				ALUSrc<=1'b1;
				BranchInst<=1'b0;
				ALUControl<=4'b1;
				CondFlag<=3'b0;
				ResultSrc<=1'b0;
				MemWrite<=1'b1;
				MemPWrite<=1'b0;
				IOFlag<=1'b0;
				MemToReg<=2'b0;
			end
			else if (InstHeader[4:3] == 2'b11) begin // LDR
				RnSrc<=1'b0;
				ImmSrc<=1'b0;
				ImmExt<=1'b1;
				RegWrite<=1'b1;
				RsSrc<=1'b1;
				PAUOp<=1'b0;
				FlagWrite<=1'b0;
				ALUSrc<=1'b1;
				BranchInst<=1'b0;
				ALUControl<=4'b1;
				CondFlag<=3'b0;
				ResultSrc<=1'b0;
				MemWrite<=1'b0;
				MemPWrite<=1'b0;
				IOFlag<=1'b0;
				MemToReg<=2'b0;
			end
			else begin // NOP por defecto
				RnSrc<=1'b0;
				ImmSrc<=1'b0;
				ImmExt<=1'b0;
				RegWrite<=1'b0;
				RsSrc<=1'b0;
				PAUOp<=1'b0;
				FlagWrite<=1'b0;
				ALUSrc<=1'b0;
				BranchInst<=1'b0;
				ALUControl<=4'b0;
				CondFlag<=3'b0;
				ResultSrc<=1'b0;
				MemWrite<=1'b0;
				MemPWrite<=1'b0;
				IOFlag<=1'b0;
				MemToReg<=2'b0;
			end
		end
		else if (InstHeader[6:5] == 2'b10) begin // inst de branch
			RnSrc<=1'b0;
			ImmSrc<=1'b1;
			ImmExt<=1'b0;
			RegWrite<=1'b0;
			RsSrc<=1'b0;
			PAUOp<=1'b0;
			FlagWrite<=1'b0;
			ALUSrc<=1'b0;
			BranchInst<=1'b1;
			ALUControl<=4'b0;
			CondFlag<=InstHeader[9:7];
			ResultSrc<=1'b0;
			MemWrite<=1'b0;
			MemPWrite<=1'b0;
			IOFlag<=1'b0;
			MemToReg<=2'b0;
		end
		else begin
			RnSrc<=1'b0;
			ImmSrc<=1'b0;
			ImmExt<=1'b0;
			RegWrite<=1'b0;
			RsSrc<=1'b0;
			PAUOp<=1'b0;
			FlagWrite<=1'b0;
			ALUSrc<=1'b0;
			BranchInst<=1'b0;
			ALUControl<=4'b0;
			CondFlag<=3'b0;
			ResultSrc<=1'b0;
			MemWrite<=1'b0;
			MemPWrite<=1'b0;
			IOFlag<=1'b0;
			MemToReg<=2'b0;
		end
	end 
endmodule 