module Extend_Circuit_add5(in_27, out_32);

input [26:0] in_27;
output reg [31:0] out_32;


//Pega a entrada de 27 bits e concatena com 5 zeros a esquerda
always @(*) begin
	
	out_32 = {5'b00000,in_27};
end

endmodule