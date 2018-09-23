module UmbralUnit #(parameter N=32)
						 (input logic [N-1:0] pixel,
						  input logic [N-1:0] umbral,
						  output logic [N-1:0] out);
	assign out[7:0] = (pixel[7:0]>=umbral)? 1 : 0;
	assign out[15:8] = (pixel[15:8]>=umbral)? 1 : 0;
	assign out[23:16] = (pixel[23:16]>=umbral)? 1 : 0;
	assign out[31:24] = (pixel[31:24]>=umbral)? 1 : 0;
endmodule 