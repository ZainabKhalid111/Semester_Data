
module parity_det_1always (x, rst, clk, z);
	
	input x, rst, clk;
	output z; reg z;
	
	reg even_odd;
	
	parameter EVEN = 0, ODD = 1;
	
	always @(posedge clk, rst)
		if (rst) begin
			even_odd <= EVEN;
			z <= 0;
		end
		else
			case (even_odd)
				EVEN: begin
					z <= x? 1:0;
					even_odd <= x? ODD:EVEN;
				end
				ODD: begin
					z <= x? 0:1;
					even_odd <= x? EVEN:ODD;
				end
			endcase

endmodule

module tst_parity_det1;

	reg x, rst, clk;
	wire z;
	
	parity_det_1always pd (x, rst, clk, z);
	
	initial	begin
		clk = 0;
		x = 0;
		#10 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 0;
		#20 x = 1;
	end

	initial	begin
		rst = 1;
		#10 rst = 0;	
	end			
	
	always 
		#10 clk = ~clk;	
		
endmodule








