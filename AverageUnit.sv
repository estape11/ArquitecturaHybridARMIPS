// Recibe un pixel RGB y devuelve su promedio
module AverageUnit #(parameter N=32)
						  (input logic [N-1:0] pixel,
							output logic [N-1:0] out);
	//assign out = (pixel[7:0]+pixel[15:8]+pixel[23:16])/2'b11;
	logic [9:0] outADD1, outADD2, etapa1, etapa2, etapa3;
	nBitsADD #(10) ADD1 ({2'b0,pixel[7:0]},{2'b0,pixel[15:8]},1'b0,outADD1);
	nBitsADD #(10) ADD2 ({2'b0,pixel[23:16]}, outADD1, 1'b0, outADD2);
	
	nBitsADD #(10) ADD3 (outADD2, outADD2>>2'b10, 1'b0, etapa1);
	nBitsADD #(10) ADD4 (etapa1, etapa1>>3'b100, 1'b0, etapa2);
	nBitsADD #(10) ADD5 (etapa2, etapa2>>4'b1000, 1'b0, etapa3);
	assign out = etapa3>>2'b10;
endmodule 