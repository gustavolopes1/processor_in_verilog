module Mux_Mem_to_Reg (out_ULA, Read_Data, Mem_to_Reg, Write_Data);

input [31:0] out_ULA;
input [31:0] Read_Data;
input Mem_to_Reg;
output reg [31:0] Write_Data;

always @(*) begin
	if(Mem_to_Reg)
		begin
			Write_Data = Read_Data;
		end
	else
		begin
			Write_Data = out_ULA;
		end
end

endmodule
