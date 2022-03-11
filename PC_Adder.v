module PC_Adder(PC_current,PC_next, reset);

	input [31:0] PC_current;
	input reset;
	
	output reg [31:0] PC_next;
	
	always @(*) begin
		
		if(reset)
		begin
			PC_next = 0;
		end
		else
		begin
			PC_next = PC_current + 1; //soma 1 representado em 32 bits para ir para a proxima linha do .txt
		end
	end
	
endmodule