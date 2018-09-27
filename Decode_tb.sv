module Decode_tb();
	logic [31:0] inst, PC, DataWrite, Ra, Rb, ExtImm;
	logic [3:0] Rd, ALUControl, RdOut;
	logic [2:0] CondFlag;
	logic [1:0] MemToReg;
	logic clk, MemPWrite, RegWriteOut, MemWrite, BranchInst, ALUSrc, FlagWrite, PAUOp, IOFlag, ResultSrc, RegWrite;
	
	Decode #(32) DUT(inst, PC, DataWrite,
					 Rd,
					 clk, RegWrite,
					 Ra, Rb, ExtImm,
					 RdOut,
					 MemPWrite, RegWriteOut, MemWrite, BranchInst, ALUSrc, FlagWrite, PAUOp, IOFlag, ResultSrc,
					 ALUControl,
					 CondFlag,
					 MemToReg);
	initial begin
		clk=1'b1;
		inst=32'b00000000100001000000100000000000;
		PC=32'hFFCC;
		DataWrite=32'hABC;
		Rd=4'b101;
		RegWrite=1'b1;
	end
	
	always begin
		#1
		clk=~clk;
	end
endmodule 