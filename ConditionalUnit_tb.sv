module ConditionalUnit_tb();
	logic z, v, n, enable1, enable2, clk, out;
	logic [2:0] cond;
	ConditionalUnit DUT (z, v, n, enable1, enable2, clk, cond ,out); // enable1 -> reg de banderas, enable2 -> condicion
	
	initial begin
		clk=1'b0;
		enable1=1'b0;
		enable2=1'b0;
		z=1'b1;
		v=1'b0;
		n=1'b0;
		#1
		enable1=1'b1;
		enable2=1'b0;
		cond=3'b0;
		#1
		z=1'b0;
		v=1'b0;
		n=1'b0;
		#1
		enable1=1'b0;
		#1
		enable2=1'b1;
		cond=3'b100;
		#1
		enable2=1'b0;
		#1
		enable1=1'b1;
		z=1'b0;
		v=1'b1;
		n=1'b1;
		#2
		enable1=1'b0;
	end
	
	always begin
		#1
		clk=~clk;
	end
endmodule 