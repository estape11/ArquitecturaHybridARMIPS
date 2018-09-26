module BancoRegistrosTB();

		logic[31:0] dato;
		logic[3:0] addr1;
		logic[3:0] addr2;
		logic[3:0] addr3;
		logic[31:0] datosalida1;
		logic[31:0] datosalida2;
		logic [31:0]pc;
		logic clk;
		logic enable;

		BancoRegistros DUT (clk,enable,addr1,addr2,addr3,dato,pc,datosalida1,datosalida2);
		
		initial begin
		   clk = 1; 
			
			enable = 1;
			addr3 = 0;
			dato = 100;
			#4
			addr1 = 0;
			#4
			addr2 = 1;
	end
endmodule
