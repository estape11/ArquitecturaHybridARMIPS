module PixelMemory #(parameter N = 32, I = 640, J = 240)
					(input  logic clk, enable, // activa la escritura
					 input  logic [N-1:0] address, data_in,
					 output logic [N-1:0] data_out);

	logic [I-1:0] mem [J];
	logic [N/2:0] i, j, ix2,ix2p1; // ix2 y ix2+1
	assign i = address[N/2-1:0];
	assign j = address[N-1:N/2];
	assign ix2=i<<2'b1;
	assign ix2p1 =ix2+1'b1;
	initial begin
		$readmemb("D:/ArquiI/ArquitecturaHybridARMIPS/pix.mem", mem); // cambiar ruta de cada uno
	end
	always_ff @(negedge clk) begin
		if (enable) begin 
			mem[j][ix2]<= data_in[0];
			mem[j][ix2p1]<= data_in[1];
		end
	end
	
	always_ff @(posedge clk) begin
		if (~enable) data_out <= {mem[j][ix2p1],mem[j][ix2]};
	end
endmodule 