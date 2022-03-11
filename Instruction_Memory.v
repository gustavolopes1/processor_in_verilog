module Instruction_Memory

#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=4)
(
	input [(ADDR_WIDTH-1):0] Read_Address,
	input clock,
	output reg [(DATA_WIDTH-1):0] Instruction
);

	reg [DATA_WIDTH-1:0] Instruction_Memory[2**ADDR_WIDTH-1:0];

	
	initial
	begin
	
		$readmemb("algoritmo_a_ser_executado.txt", Instruction_Memory);
	end

	
	always @ (posedge clock) // É o clock direto de 50MHz FPGA 
	begin
		Instruction <= Instruction_Memory[Read_Address];
	end

	
endmodule
