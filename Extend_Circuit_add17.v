module Extend_Circuit_add17(in_15, out_32);

input [14:0] in_15;
output reg [31:0] out_32;


//Pega a entrada de 15 bits e concatena com 17 zeros a esquerda
always @(*) begin
	
	out_32 = {17'b00000000000000000,in_15};
end

endmodule