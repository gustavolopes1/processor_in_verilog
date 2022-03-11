module Jarvis_ALUControl(ALU_Op, Op_Code, funct, ALU_Control);

	input [1:0] ALU_Op;
	input [4:0] Op_Code;
	input [4:0] funct;
	
	output reg [4:0] ALU_Control; //Irá para a ULA identificar a operação a ser realizada
	
	always @(*) begin
		case(ALU_Op)
			0: begin // ALU_Op = 0 São as instruções que não usam a ULA
				ALU_Control = 0;
			end
			1: begin //Instruções Aritméticas e Lógicas variam apenas o funct
				case(funct)
					5'b00000: begin   //Instrução ADD
						ALU_Control = 0;
					end
					5'b00001: begin   //Instrução SUB
						ALU_Control = 1;
					end
					5'b00010: begin   //Instrução MULT
						ALU_Control = 2;
					end
					5'b00011: begin   //Instrução DIV
						ALU_Control = 3;
					end
					5'b00100: begin   //Instrução MOD
						ALU_Control = 4;
					end
					5'b00101: begin   //Instrução AND					
						ALU_Control = 6;
					end
					5'b00110: begin   //Instrução OR						
						ALU_Control = 7;
					end
					5'b00111: begin   //Instrução XOR					
						ALU_Control = 8;
					end
					5'b01000: begin   //Instrução NOT						
						ALU_Control = 9;
					end
					
				endcase
			end
			2: begin
				case(Op_Code)
					5'b00011: begin   //Instrução Move				
						ALU_Control = 5;
					end
					5'b00101: begin   //Instrução ADDI				
						ALU_Control = 0;
					end
					5'b00110: begin   //Instrução SUBI				
						ALU_Control = 1;
					end
					5'b00111: begin   //Instrução SLL					
						ALU_Control = 10;
					end
					5'b01000: begin   //Instrução SRL					
						ALU_Control = 11;
					end
					
					5'b01010: begin   //Instrução ANDI				
						ALU_Control = 6;
					end
					
					5'b01100: begin   //Instrução ORI				
						ALU_Control = 7;
					end
				
					5'b01110: begin   //Instrução BEQ		
						ALU_Control = 12;
					end
					5'b01111: begin   //Instrução BNE			
						ALU_Control = 13;
					end
					5'b10000: begin   //Instrução BGTEZ				
						ALU_Control = 14;
					end
					5'b10001: begin   //Instrução BGTZ					
						ALU_Control = 15;
					end
					5'b10010: begin   //Instrução BLTEZ						
						ALU_Control = 16;
					end
					5'b10011: begin   //	Instrução BLTZ					
						ALU_Control = 17;
					end
					5'b10100: begin   //Instrução SLT						
						ALU_Control = 18;
					end
					
				endcase
			end
		endcase
	end

endmodule
	