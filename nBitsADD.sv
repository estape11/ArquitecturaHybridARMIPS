//Sumador completo de 1 bit
module fullAdder(input logic a,b,cin,
					  output logic out,cout);
	assign out = (a ^ b) ^ cin;
	assign cout = ( b & cin) | (a & b) | (a & cin);
endmodule


//Sumador completo de N bits
module nBitsADD #(parameter N=32)
					  (input logic [N-1:0] a,b,
					   input logic cin,
					   output logic [N-1:0] out,
					   output logic cout);
	logic [N-1:0] carry; // para conectar los acarreos entre los comp. generados
   genvar i;
   generate 
		// for para generar los N componentes
		for(i=0;i<N;i=i+1)
			begin: generateNbitAdder
				if(i==0)
					fullAdder f(a[0],b[0],cin,out[0],carry[0]); 
				else
					fullAdder f(a[i],b[i],carry[i-1],out[i],carry[i]);
			end
		assign cout = carry[N-1];
   endgenerate
endmodule 