module Data_Memory

#(parameter DATA_WIDTH=32, parameter ADDR_WIDTH=8)
(
	input [(DATA_WIDTH-1):0] Write_Data,
	input [(ADDR_WIDTH-1):0] Address,
	input Mem_Read,
	input Mem_Write,
	input clock,
	output [(DATA_WIDTH-1):0] Read_Data
);


	reg [DATA_WIDTH-1:0] Data_Memory[2**ADDR_WIDTH-1:0];
	reg [(ADDR_WIDTH-1):0] Address_aux;	
	
	always @ (posedge clock) // clock dividido de 1sg, clock do sistema, clock principal
	begin
			if (Mem_Write)
					Data_Memory[Address] <= Write_Data;
			
			Address_aux <= Address;
			
			
	end
		

	
	assign Read_Data = Data_Memory[Address_aux];

	
	
endmodule
