module Register_tb();
	logic [31:0] in, out;
	logic clk;
	Register #(32) register (in,clk,out);
	initial begin
		clk=1;
		in=32'b101;
		#5
		in=32'b11111000;
		
	end
	always begin
		#1
		clk=~clk;
	end
endmodule 