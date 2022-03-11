module JarvisULA(in1, in2,out,branch,shamt,ALU_Control);

	input [31:0] in1;
	input [31:0] in2;
	output reg [31:0] out;
	output reg branch;
	input [3:0] shamt;
	input [4:0] ALU_Control;
	

	always @(*) begin
	
		case(ALU_Control)
		
		// Instrução ADD  
		5'b00000 : begin 
			out = in1+in2;
			branch = 0;
		end
		
		// Instrução SUB	
		5'b00001: begin 
			out = in1-in2;
			branch = 0;
		end
		
		//Instrução MULT
		5'b00010: begin 
			out = in1*in2;
			branch = 0;
		end
		
		//Instrução DIV
		5'b00011: begin 
			out = in1/in2;
			branch = 0;
		end
		
		//Instrução MOD	
		
		5'b00100: begin 
			out = in1 % in2;
		
			branch = 0;
		end
		
		//Instrução MOV	
		5'b00101: begin
			out = in1;
			branch = 0;
		end
	
		//Instrução AND 	
		5'b00110: begin 
			out = in1 & in2;
			branch = 0;
		end	
		
		//Instrução OR	
		5'b00111: begin  
			out = in1 | in2;
			branch = 0;	
		end

		//Instrução XOR	
		5'b01000: begin 
			out = in1 ^ in2;
			branch = 0;	
		end
		
		//Instrução NOT	
		5'b01001: begin 
			out = ~in1;
			branch = 0;
			
		end
		//Instrução SLL 
		5'b01010: begin 
			out = in1 << shamt;
			branch = 0;	
		end
		
		//Instrução SRL 
		5'b01011: begin 
			out = in1 >> shamt;
			branch = 0;
		end	
		
		//Instrução BEQ 	
		5'b01100: begin 
			out = 0;
			branch = (in1==in2) ? 1 : 0;
		end
		
		//Instrução BNE
		5'b01101: begin  
			out = 0;
			branch = (in1!=in2) ? 1 : 0;
		end
		
		//Instrução BGTEZ
		5'b01110: begin 
			out = 0;
			branch = (in1>=0) ? 1 : 0;
		end
		
		//Instrução BGTZ
		5'b01111: begin 
			out = 0;
			branch = (in1>0) ? 1 : 0;
				
		end
		//Instrução BLTEZ 
		5'b10000: begin 
			out = 0;
			branch = (in1<=0) ? 1 : 0;		
		end
		
		//Instrução BLTZ 
		5'b10001: begin 
			out = 0;
			branch = (in1<0) ? 1 : 0;	
		end
		
		//Instrução SLT 
		5'b10010: begin 
			out = (in1<in2) ? 1 : 0;
			branch = 0;
		end
		
		endcase
	end
	
endmodule