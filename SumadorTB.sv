module SumadorTB();
	
	logic [31:0]sumando1;
	logic [31:0]sumando2;
	logic	[31:0]resultado;
	
	Sumador DUT(sumando1, sumando2, resultado);
	
	initial begin
		resultado = 0;
		sumando1 = 1;
		sumando2 = 1;
		#2
		sumando1 = 2;
		sumando2 = 2;
		#2
		sumando1 = 3;
		sumando2 = 3;
	end
endmodule