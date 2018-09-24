module Sumador(input [31:0]sumando1,
		         input [31:0]sumando2,
		         output logic [31:0]resultado);
	logic [31:0]resul = 0;
	//logic [31:0]resultado = 0;
	//assign resultado_out = resultado;
	assign resultado = resul;
	always @(sumando1, sumando2) begin
		resul = sumando1 + sumando2;
	end
endmodule