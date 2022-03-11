module Mux_ALU_Source (Read_Data2, Immediate_Extend, ALU_Source, in2);

input [31:0] Read_Data2;
input [31:0] Immediate_Extend;
input ALU_Source;
output reg [31:0] in2;



always @(*) begin
	if(ALU_Source)
		begin
			in2 = Immediate_Extend;
		end
	else
		begin
			in2 = Read_Data2;
		end		

end
endmodule
