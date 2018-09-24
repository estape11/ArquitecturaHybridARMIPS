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
	
	
	/*Prueba 1
		1. llenar 3 posiciones de memoria de instrucciones (Realizado directamente en el simulador)
		2. Utilizando solamente el sumador leer 4 instrucciones
	*/
	/*
	initial begin
		PCsrc <= 0; //Acutaliza el PC con el valor del sumador
		PCalu <= 0; 
	end
	*/
	
	/*Prueba 2
		1. Llenar 5 instrucciones
		2. Leer primeras 2 utilizando el sumador
		3. Saltar la tercera e ir a la cuarta
		4. Dejar que continue a la quinta con el sumador
	*/
	
	initial begin
		PCsrc <= 0;
		PCalu <= 0;
		
		#4
		PCsrc <= 1;
		PCalu <= 5;
		#2
		PCsrc <= 0;		
	end
	
	
	
endmodule