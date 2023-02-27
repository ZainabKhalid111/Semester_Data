module traffic_lights1 (clk, light);
	
	input clk;
	output [2:0] light; reg [2:0] light;
	
	parameter S0 = 0, S1 = 1, S2 = 2;
	parameter RED = 3'b100, GREEN = 3'b010, YELLOW = 3'b001;
	
	reg [0:1] state;
	
	always @(posedge clk)
		case (state)
			S0: begin
				light <= YELLOW;
				state <= S1;
			end
			S1: begin
				light <= GREEN;
				state <= S2;
			end
			S2: begin
				light <= RED;
				state <= S0;
			end
			default: begin
				light <= RED;
				state <= S0;
			end	
		endcase

endmodule



`timescale 1s/1s
module tst_traffic_lights1;

	reg clk;
	wire [2:0] light;
	
	traffic_lights1 tf (clk, light);
	
	initial	
		clk = 0;			
			
	always 
		#5 clk = ~clk;
			
endmodule

