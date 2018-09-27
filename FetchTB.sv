module FetchTB();
	
	logic clk = 1;
	
	always begin
		#1
		clk = ~clk;
	end
	
	logic PCsrc;
	logic [31:0] PCalu;
	logic [31:0] inst;
	
	Fetch fetch(clk, PCsrc, PCalu, inst);
	
	/*
		1. Llenar 5 instrucciones
		2. Leer primeras 2 utilizando el sumador
		3. Saltar la tercera e ir a la cuarta
		4. Dejar que continue a la quinta con el sumador
	*/
	
	initial begin
		PCsrc <= 1'b0;
		PCalu <= 32'h0;
		
		#4
		PCsrc <= 1'b1;
		PCalu <= 32'h5;
		#2
		PCsrc <= 1'b0;		
	end
	
	
	
endmodule