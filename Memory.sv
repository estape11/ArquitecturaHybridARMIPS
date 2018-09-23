module Memory (input clk,
					input wr,
					input [31:0] address,
					input [31:0] data_in,
					output logic [31:0] data_out);
	//2^32 = 4 294 967 296
	//2^28 = 268 435 456
	
	logic [31:0] mem [100];
	
	always_ff @(posedge clk) begin
		if (wr == 1)
			mem[address] <= data_in;	
	end
	
	always_ff @(negedge clk) begin
		if (wr == 0)
			data_out <= mem[address];
	end
endmodule