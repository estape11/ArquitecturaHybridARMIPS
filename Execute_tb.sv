module Execute_tb();
	logic MemPWrite, RegWrite, MemWrite, BranchInst, ALUSrc, FlagWrite, PAUOp, IOFlag, ResultSrc, clk, PCSrc, 
			RegWriteOut, MemWriteOut, MemPWriteOut, IOFlagOut;
	logic [1:0] MemToReg, MemToRegOut;
	logic [2:0] CondFlag;
	logic [3:0] ALUControl;
	logic [31:0] Ra, Rb, ExtIm, ALUResult, WriteData;
	logic [3:0] Rd, RdOut;
	
	Execute #(32) DUT (MemPWrite, RegWrite, MemWrite, BranchInst, ALUSrc, FlagWrite, PAUOp, IOFlag, ResultSrc, clk,
					MemToReg, ALUControl, CondFlag, Ra, Rb, Rd, ExtIm, PCSrc, RegWriteOut, MemWriteOut, MemPWriteOut,
					IOFlagOut, MemToRegOut, ALUResult, WriteData, RdOut);
	initial begin
		clk=1'b0;
		// ADD
		MemPWrite=1'b0;
		RegWrite=1'b0;
		MemWrite=1'b0;
		BranchInst=1'b0;
		ALUSrc=1'b0;
		FlagWrite=1'b0;
		ALUControl=4'b1;
		PAUOp=1'b0;
		IOFlag=1'b0;
		ResultSrc=1'b0;
		MemToReg=2'b01;
		CondFlag=3'b0;
		Ra=32'b1010;
		Rb=32'b1011;
		Rd=4'b1010;
		ExtIm=32'b1010101;
		#2;
	end
	
	always begin
		#1
		clk=~clk;
	end
endmodule 