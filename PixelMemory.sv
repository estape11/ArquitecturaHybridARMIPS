module PixelMemory #(parameter N = 32)
					(input  logic clk, enable,
					 input  logic [N-1:0] address, data_in,
					 output logic [N-1:0] data_out);

	logic [320:0] mem [240];
	logic [15:0] i, j;
	assign i = address[N/2-1:0];
	assign j = address[N-1:N/2];
	
	always_ff @(negedge clk) begin
		if (enable) mem[j][i]<= data_in;	
	end
	
	always_ff @(posedge clk) begin
		if (~enable) data_out <= mem[j][i];
	end
endmodule 