module PAU_tb();
	logic [31:0] pix, umb, out;
	logic sel;
	PAU #(32) DUT (pix, umb, sel, out);
	initial begin
		pix=32'hFFC345;
		sel=1'b0;
		umb=32'd100;
		#1
		pix=32'hAD;
		sel=1'b1;
	end
endmodule 