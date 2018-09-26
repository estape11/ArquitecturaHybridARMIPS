module Test_tb();
	logic [31:0] inst;
	logic [2:0] cond;
	Test DUT (inst, cond);
	
	initial begin
		inst=32'b00010111001010110000000000000000;
	end
endmodule 