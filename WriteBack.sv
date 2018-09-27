module WriteBack(input logic PCSrc, RegWrite, IOFlag,
					  input logic [1:0] MemToReg,
					  input logic [31:0] IOIn, ReadData, ReadDataP, ALUOut, Rd,
					  output logic [31:0] OutData, RdOut,
					  output logic PCSrcOut, RegWriteOut);
	logic [31:0] Result;
	assign Result = (MemToReg == 2'b0) ? ReadData : (MemToReg == 2'b1) ? ALUOut : (MemToReg == 2'b10) ? ReadDataP : 32'b0;
	assign OutData = (IOFlag) ? IOIn : Result;
	assign PCSrcOut = PCSrc;
	assign RegWriteOut = RegWrite;
	assign RdOut = Rd;
endmodule   