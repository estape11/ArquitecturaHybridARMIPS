module Sumador(input [7:0]sumando1,
		         input [7:0]sumando2,
		         output logic [7:0]resultado);
	
	always @(sumando1, sumando2) begin
		resultado = sumando1 + sumando2;
	end
endmodule