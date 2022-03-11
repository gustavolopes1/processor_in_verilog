module PC_Register(PC_next, clock, reset, PC_current);

	input [31:0] PC_next; //A entrada representa a próxima instrução
	
	input reset; //O reset é uma chave para reiniciar e travar a execução do algoritmo
	input clock;

	output reg [31:0] PC_current; //A saida representa a atual instrução, que se torna a próxima a cada clock
	
	
	always @(posedge clock) begin // clock dividido de 1sg, clock do sistema, clock principal
		if(reset)
			begin
				PC_current = 0;		
			end
		else
			begin
				PC_current = PC_next;
			end
	end
	
endmodule