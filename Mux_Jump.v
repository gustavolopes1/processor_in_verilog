module Mux_Jump (PC_Branch,Immediate_Extend_J,Jump, PC_Final);

input [31:0] PC_Branch;
input [31:0] Immediate_Extend_J;
input Jump; //Sinal de Controle que indica que uma instrução Jump foi realizada
output reg [31:0] PC_Final;

always @(*) begin

	if(Jump)// pelo esquematico, jump=1 passa o endereço do jump e 0 o endereço com ou sem branch
		begin
			PC_Final = Immediate_Extend_J;
		end
	else
		begin
			PC_Final = PC_Branch;
		end
end

endmodule
