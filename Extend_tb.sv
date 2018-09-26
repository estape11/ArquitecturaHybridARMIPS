module Extend_tb();
	logic [13:0] im14;
	logic [26:0] im27;
	logic [26:0] imm;
	logic [31:0] out;
	logic im, ext;
	Extend DUT (imm,im, ext, out);
	initial begin
		im14=14'b10101010101010;
		im27=27'b111111000001010111111110000;
		imm=im14;
		im=0;
		ext=0;
		#1
		im=0;
		ext=1;
		#1
		imm=im27;
		im=1;
		ext=0;
		#1
		im=1;
		ext=1;
	end
endmodule 