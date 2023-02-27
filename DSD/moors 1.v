
//overlapping pattern
module fsm_two1s_moore1 (IN, OUT, R, CK); 
	
	input IN, R, CK;
	output OUT;
	reg OUT;
	
	parameter A = 0, B = 1, C = 2;
	reg [1:0] PS, NS;

	always @(posedge CK, R)
		if (R)
			PS <= A;
		else
			PS <= NS;
	always @(PS or IN)
		case (PS)
			A: begin
				OUT = 0;
				NS = IN?B:A;
			end
			B: begin
				OUT = 0;
				NS = IN?C:A;
			end
			C: begin
				OUT = 1;
				NS = IN?C:A;
			end
		endcase

endmodule



module tst_fsm_moore;

	reg x, rst, clk;
	wire z;
	
	fsm_two1s_moore1 fsm (.IN(x), .R(rst), .CK(clk), .OUT(z)); 
	
	initial	begin
		clk = 0;
		x = 0;
		#10 x = 1;
		#20 x = 0;
		#20 x = 1;
		#20 x = 1;
		#20 x = 1;
		#20 x = 0;
	end
	
	initial	begin		
		rst = 1;
		#10 rst = 0;			
	end			
	
	always 
		#10 clk = ~clk;	
		
endmodule



