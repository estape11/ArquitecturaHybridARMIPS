module WriteBack_tb();
	logic PCSrc, RegWrite, IOFlag, PCSrcOut, RegWriteOut;
	logic [1:0] MemToReg;
	logic [31:0] IOIn, ReadData, ReadDataP, ALUOut, Rd,OutData, RdOut;
	
	WriteBack DUT (PCSrc, RegWrite, IOFlag,
					  MemToReg,
					  IOIn, ReadData, ReadDataP, ALUOut, Rd,
					  OutData, RdOut,
					  PCSrcOut, RegWriteOut);
	initial begin
		PCSrc = 1'b0;
		RegWrite = 1'b0;
		IOFlag = 1'b0;
		MemToReg = 2'b1;
		IOIn=32'b111100;
		ReadData=32'b1010101;
		ReadDataP=32'b1111111;
		ALUOut=32'b10110;
		Rd=32'b11100110;
		#1
		MemToReg = 2'b0;
		#1
		MemToReg = 2'b10;
	end
endmodule 