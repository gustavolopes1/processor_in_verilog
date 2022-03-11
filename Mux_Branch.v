module Mux_Branch (PC_next, PC_next_I, Branch_ULA,Branch,PC_Branch);

input [31:0] PC_next;
input [31:0] PC_next_I;
input Branch; // sinal da unidade de controle
input Branch_ULA; //sinal equal advindo da ULA, no módulo da ULAeu nomeei como branch
output reg [31:0] PC_Branch;

always @(*) begin
	if(Branch_ULA && Branch) // Esse é o add encontrado no esquemático
		begin
			PC_Branch = PC_next_I; //PC que vem do imediato extendido
		end
	else
		begin
			PC_Branch = PC_next; // PC+1 
		end
end

endmodule
