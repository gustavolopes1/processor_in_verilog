module Registers_Bank(Read_Register1,Read_Register2,Write_Register,Write_Data,Reg_Write,Read_Data1,Read_Data2,clock); 

	input [5:0] Read_Register1;
	input [5:0] Read_Register2;
	input [5:0] Write_Register;
	input [31:0] Write_Data;
	input Reg_Write; //Sinal da unidade de controle
	input clock;
	
	reg [31:0] Registers_Bank[63:0];

	
	output [31:0] Read_Data1;
	output [31:0] Read_Data2;


	
	initial
		begin
			Registers_Bank[0] = 0; // Seguindo a mesma ideia do MIPS, o primeiro registrador foi setado como 0
		end
		
			
	assign Read_Data1 = Registers_Bank[Read_Register1]; 
	assign Read_Data2 = Registers_Bank[Read_Register2];

	
	
	// A escrita é sequencial ( está no always abaixo) e a leitura é combinacional (está no assign acima)
	
	
	always @(posedge clock) //  clock dividido de 1sg, clock do sistema, clock principal
	
	begin
			
		if(Reg_Write)
		
			Registers_Bank[Write_Register] <= Write_Data;
			
	end


	
endmodule
