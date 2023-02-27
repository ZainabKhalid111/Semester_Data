//non overlapping pattern

module fsm_two1s_moore2 (IN, OUT, R, CK);
	
	input IN, R, CK;
	output Lock,alarm;
	wire lock,alarm;
	
	parameter s0 = 0, s1= 1, s2 = 2,s3=0;
	reg [1:0] PS, NS;

	always @(posedge CK, R)
		if (R)
			PS <= S0;
		else
			PS <= NS;
	always @(PS or IN)
		case (PS)
			A: NS = IN?B:A;
			B: NS = IN?C:A;
			C: NS = IN?B:A;
		endcase
	
	assign OUT = (PS==C);

endmodule

module tst_fsm_moore;

	reg x, rst, clk;
	wire z;
	
	fsm_two1s_moore2 fsm (.IN(x), .R(rst), .CK(clk), .OUT(z)); 
	
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








