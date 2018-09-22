module(input sumando1,
		 input sumando2,
		 output logic resultado);
	
	always @(sumando1, sumando2) begin
		resultado = sumando1 + sumando2;
	end
endmodule