module ControlUnit_tb();
	logic [9:0] InstHeader;
	logic RnSrc, ImmSrc, RsSrc, ResultSrc, IOFlag, PAUOp, ImmExt, FlagWrite, ALUSrc, BranchInst, MemWrite, RegWrite, MemPWrite;
	logic [3:0] ALUControl;
	logic [2:0] CondFlag;
	logic [1:0] MemToReg;
	
	ControlUnit DUT (InstHeader,
						 RnSrc, ImmSrc, RsSrc, ResultSrc, IOFlag, PAUOp, ImmExt, FlagWrite, ALUSrc, BranchInst, MemWrite, RegWrite, MemPWrite,
						 ALUControl,
						 CondFlag,
						 MemToReg);
	initial begin
		InstHeader = 10'b0000000010;
		#1
		InstHeader = 10'b0000010010;
		#1
		InstHeader = 10'b0000100000;
		#1
		InstHeader = 10'b0000111000;
		#1
		InstHeader = 10'b0000000111;
		#1
		InstHeader = 10'b0001000000;
		#1
		InstHeader = 10'b0000001010;
		#1
		InstHeader = 10'b0000001011;
		#1
		InstHeader = 10'b0000000011;
		#1
		InstHeader = 10'b0000010011;
		#1
		InstHeader = 10'b0000010111;
	end
endmodule 
