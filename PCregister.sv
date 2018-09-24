module PCregister(
       input clk,
		 input [31:0] pc_in,
		 output [31:0] pc_out);
	
	logic [31:0]pc;
	assign pc_out = pc;
	
	initial begin 
		pc = 0;
	end
	
	always_ff @(posedge clk) begin
		pc = pc_in;
	end
endmodule