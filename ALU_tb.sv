module ALU_tb();
	logic [7:0] a,b, out;
	logic [3:0] sel;
	logic z,n,v;
	ALU #(8) DUT (a,b,sel,z,n,v,out);
	initial begin 
		a=8'b1111111;
		b=8'b101;
		sel=4'b0; // nop
		#1
		sel=4'b1; // ADD
		#1
		a=8'hCC;
		b=8'hCC;
		sel=4'b10;  // SUB
		#1
		a=8'd57;
		b=8'd51;
		sel=4'b10;  // SUB
		#1
		a=8'd30;
		b=8'd100;
		sel=4'b10;  // SUB
		#1
		a=8'b11111111;
		b=8'b10;		
		sel=4'b11; // SHIFT LEFT
		#1
		sel=4'b100; // SHIFT RIGHT
		#1
		sel=4'b101; // AND
		#1
		sel=4'b110; // OR
		#1
		sel=4'b111; // OPER B
		#1
		sel=4'b1000; // OPER A
		#1
		sel=4'b1001; // Vcc
	end
endmodule 