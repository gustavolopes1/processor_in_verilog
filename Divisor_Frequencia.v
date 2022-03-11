module Divisor_Frequencia(clkin,clkout);

	input clkin;
	output reg clkout;
	
	reg [25:0] OUT;
	
	always @ (posedge clkin)
	
		if (OUT == 26'd25000000)
		
				begin
				
					OUT<= 26'd0;
					clkout <= ~ clkout;
					
				end
		else
				begin
				
					OUT<= OUT+1;
					
				end
endmodule
