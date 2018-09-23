module PCregister(
       input clk,
		 input [31:0] pc_in,
		 output logic [31:0] pc_out);
		
	initial begin 
		pc_out = 0;
	end
	
	always_ff @(posedge clk) 
		pc_out = pc_in;
		
endmodule