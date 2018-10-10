module Display_7segments_controller(input logic a0, a1, a2, a3,
												output a,b,c,d,e,f,g); // segmentos del display
	assign a = (~a0 & a1 & ~a2 & ~a3) | (~a0 & ~a1 & ~a2 & a3) | (a0 & a1 & ~a2 & a3) | (a0 & ~a1 & a2 & a3);
	assign b = (~a0 & a1 & ~a2 & a3) | (a0 & a2 & a3) | (a1 & a2 & ~a3) | (a0 & a1 & a2) | (a0 & a1 & ~a3);
	assign c = (~a0 & ~a1 & a2 & ~a3) | (a0 & a1 & ~a3) | (a0 & a1 & a2);
	assign d = (~a0 & ~a1 & ~a2 & a3) | (a1 & a2 & a3) | (~a0 & a1 & ~a2 & ~a3) | (a0 & ~a1 & a2 & ~a3);
	assign e = (~a0 & a1 & ~a2) | (~a1 & ~a2 & a3) | (~a0 & a3);
	assign f = (~a0 & ~a1 & a2) | (~a0 & ~a1 & a3) | (~a0 & a2 & a3) | (a0 & a1 & ~a2 & a3);
	assign g = (~a0 & ~a1 & ~a2) | (a0 & a1 & ~a2 & ~a3);
endmodule 