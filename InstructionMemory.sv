module InstructionMemory (
					input clk,
					input [31:0] address,
					output logic [31:0] data_out
					);
	//2^32 = 4 294 967 296
	//(2^32)/4 = 1073741824
	//2^28 = 268 435 456
	
	logic [31:0] mem [100];
	
	assign data_out = mem[address];
endmodule