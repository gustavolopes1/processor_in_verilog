module Jarvis_ControlUnit(Op_Code, Branch, ALU_Op, ALU_Source, Mem_Write,Mem_Read,Mem_to_Reg, Reg_Dest, Reg_Write, Jump,reset);

	input [4:0] Op_Code;

	output reg Branch;
	output reg [1:0] ALU_Op;
	output reg ALU_Source;
	output reg Mem_Write;
	output reg Mem_Read;
	output reg Mem_to_Reg;
	output reg Reg_Dest;
	output reg Reg_Write;
	output reg Jump;
	output reg reset;
	

	always @(*) begin
		case(Op_Code)
			5'b00000: begin   // Instruções Aritméticas 
				
				Branch = 0;
				ALU_Op = 1;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=1;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
	
			end
			5'b00001: begin   // Instrução Load Word
			
				Branch = 0;
				ALU_Op = 0;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=1;
				Mem_to_Reg=1;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b00010: begin   //Instrução Store Word
					
				Branch = 0;
				ALU_Op = 0;
				ALU_Source= 1;
				Mem_Write=1;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b00011: begin   //Instrução Move
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b00100: begin   //Instrução Jump
					
				Branch = 0;
				ALU_Op = 0;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump =1; // Só o sinal jump fica ativo
				reset = 0;
			end
			5'b00101: begin   //Instrução AddI
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b00110: begin   //Instrução SubI
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b00111: begin   //Instrução SLL
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01000: begin   //Instrução SRL
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01001: begin   //Instrução AND
					
				Branch = 0;
				ALU_Op = 1;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=1;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01010: begin   //Instrução ANDI
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write =0;
				Mem_Read=0;
				Mem_to_Reg =0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01011: begin   //Instrução OR
					
				Branch = 0;
				ALU_Op = 1;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=1;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01100: begin   //Instrução ORI
					
				Branch = 0;
				ALU_Op = 2;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01101: begin   //Instrução XOR
					
				Branch = 0;
				ALU_Op = 1;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=1;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b01110: begin   //Instrução BEQ
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b01111: begin   //Instrução BNE
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b10000: begin   //Instrução BGTEZ
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b10001: begin   //Instrução BGTZ
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b10010: begin   //Instrução BLTEZ
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b10011: begin   //Instrução BLTZ
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			5'b10100: begin   //Instrução SLT
					
				Branch = 1;
				ALU_Op = 2;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=1;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b10101: begin   //Instrução NOT 
					
				Branch = 0;
				ALU_Op = 1;
				ALU_Source= 1;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=1;
				Jump = 0;
				reset = 0;
			end
			5'b11111: begin   //Instrução NOP, Ultima Instrução, a 32
					
				Branch = 0;
				ALU_Op = 0;
				ALU_Source= 0;
				Mem_Write=0;
				Mem_Read=0;
				Mem_to_Reg=0;
				Reg_Dest=0;
				Reg_Write=0;
				Jump = 0;
				reset = 0;
			end
			
		endcase
	end
		
endmodule	
				