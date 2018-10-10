module TOP(input logic clk, output logic [6:0] inst7, inst6, inst5, inst4, inst3, inst2, inst1, inst0);
	logic halt, reset;
	logic [31:0] inst;
	assign halt=1'b0;
	assign reset=1'b0;
	
	Display_7segments_controller D0 (inst[3],inst[2],inst[1],inst[0],
												inst0[6],inst0[5],inst0[4],inst0[3],inst0[2],inst0[1],inst0[0]);
	Display_7segments_controller D1 (inst[7],inst[6],inst[5],inst[4],
												inst1[6],inst1[5],inst1[4],inst1[3],inst1[2],inst1[1],inst1[0]);
	Display_7segments_controller D2 (inst[11],inst[10],inst[9],inst[8],
												inst2[6],inst2[5],inst2[4],inst2[3],inst2[2],inst2[1],inst2[0]);
	Display_7segments_controller D3 (inst[15],inst[14],inst[13],inst[12],
												inst3[6],inst3[5],inst3[4],inst3[3],inst3[2],inst3[1],inst3[0]);
	Display_7segments_controller D4 (inst[19],inst[18],inst[17],inst[16],
												inst4[6],inst4[5],inst4[4],inst4[3],inst4[2],inst4[1],inst4[0]);
	Display_7segments_controller D5 (inst[23],inst[22],inst[21],inst[20],
												inst5[6],inst5[5],inst5[4],inst5[3],inst5[2],inst5[1],inst5[0]);
	Display_7segments_controller D6 (inst[27],inst[26],inst[25],inst[24],
												inst6[6],inst6[5],inst6[4],inst6[3],inst6[2],inst6[1],inst6[0]);
	Display_7segments_controller D7 (inst[31],inst[30],inst[29],inst[28],
												inst7[6],inst7[5],inst7[4],inst7[3],inst7[2],inst7[1],inst7[0]);
	ArquitecturaHybridARMIPS ARMIPS (~clk, reset, halt, inst); // por el boton
endmodule 