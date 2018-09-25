module MemoryStage(
	input logic clk,
	input logic MEMWrite, //bandera de lectura o escritura
	input logic [31:0]ALUresult,
	input logic [31:0]WriteData,
	input logic [3:0]RdIn,  //Sirve para indicar el registro destino en STR
	output logic [31:0]ReadData,
	output logic [31:0]ALUresultOut,
	output logic [3:0]RdOut
	);
	
	assign ALUresultOut = ALUresult;
	assign RdOut = RdIn;
	
	Memory data_memory(clk, MEMWrite, ALUresult, WriteData, ReadData);
endmodule