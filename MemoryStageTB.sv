module MemoryStageTB();
	
	parameter N = 32;

	logic clk, MEMWrite, MemPWrite, PCSrc, RegWrite, IOFlag;
	logic [1:0] MemToReg;
	logic [N-1:0] address, WriteData;
	logic [3:0] RdIn;
	//outputs
	logic [N-1:0] ReadDataDataMem, ReadDataPixMem, ALUresultOut;
	logic [3:0]  RdOut;
	logic PCSrcOut, RegWriteOut, IOFlagOut;
	logic [1:0] MemToRegOut;
							
	MemoryStage #(N) memoryStage 
						  (clk, MEMWrite, MemPWrite, PCSrc, RegWrite, IOFlag,
							MemToReg,
							address, WriteData,
							RdIn,
							ReadDataDataMem, ReadDataPixMem, ALUresultOut,
							RdOut,
							PCSrcOut, RegWriteOut, IOFlagOut,
							MemToRegOut);
							
	always begin
		#1
		clk = ~clk;
	end
	
	
	initial begin
		clk = 1;
		
		MEMWrite = 1;
		MemPWrite = 0;

		PCSrc = 0;
	   address = 32'b0;
		WriteData = 32'b1; //escribe 1
	   
	   //registros que pasan directo
		RegWrite = 1;
		IOFlag = 1;
		MemToReg = 2'b0;
		RdIn = 4'b0;
		//***************************
		//notar que el dato de escritura no varia
		
		//datos lee
		//pixels escribe
		#4
		MEMWrite = 0;
		MemPWrite = 1;
		
		//datos escribe
		//pixels lee
		#4
		MEMWrite = 0;
		MemPWrite = 1;
		
		//En este punto debe verse reflejado el pixel escrito
		//datos escribe
		//pixels lee
		#4
		MEMWrite = 1;
		MemPWrite = 0;
	end
endmodule