module Mux_Reg_Dst (Reg_20_15, Reg_14_09, Reg_Dest, Write_Register);

input [5:0] Reg_20_15;// bits 20 a 15 da instrução
input [5:0] Reg_14_09; // bits 14 a 9 da instrução
input Reg_Dest; // Esse mux é controlado por esse sinal de controle
output reg [5:0]  Write_Register;

always @(*) begin
	if(Reg_Dest)
		begin
			Write_Register = Reg_20_15;
		end
	else
		begin
			Write_Register = Reg_14_09;
		end
end

endmodule
