
//homework 4 : lock

module fsm_lock_mealys (IN, R, CLK,Lock,Alarm);
	
	input IN, R, CLK;
	output Lock,Alarm;
	reg Lock,Alarm;
	
	parameter s0 = 0, s1= 1, s2 = 2,s3=3;
	reg [1:0] PS, NS;

	always @(posedge CLK,R)
		if (R)
			PS <= s0;
		else
			PS <= NS;
			
	always @(PS or IN)
		case (PS)
			s0: 
			begin
			Lock=IN? 0:0;
			Alarm=IN? 1:0;
			NS = IN?s0:s1;
			end
			
			s1: 
			begin
			Lock=IN? 0:0;
			Alarm=IN? 0:1;
			NS = IN?s2:s0;
			end
			
			s2: 
			begin
			Lock=IN? 0:1;
			Alarm= IN? 1:0;
			NS = IN?s0:s3;
			end
			
			s3: 
			begin
			Lock=IN? 0:0;
			Alarm=IN? 0:0;
			NS = IN? s0:s0;
			end
			
		endcase

endmodule

module tst_fsm_lock;

	reg IN,R,CLK;
	wire Lock,Alarm;
	
	fsm_lock_mealys fl(IN, R, CLK,Lock,Alarm);
	
	initial	begin
	CLK = 0;
	 IN = 0;
	#10 IN  = 1;	
	#20 IN  = 0;
	//sequence complete
	#20 IN  = 0;
	#20 IN  = 1; 
	#20 IN  = 0;
	#20 IN  = 1;
	#20 IN  = 0;
	
	end
	
	initial	begin		
		R = 1;
		#10 R = 0;	
		#30 R=1;
		#30 R=0;
			
	end			
	
	always 
		#10 CLK = ~CLK;	
		
	initial
	$monitor($time, "  ->  IN=%b,  Lock=%b , Alarm=%b , Reset=%b", IN,Lock, Alarm, R);
		
endmodule









