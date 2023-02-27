
module electric_lock (
    input sequence_in, input reset, input clk, output reg lockSys, output reg alarm 
);


    parameter s0 = 0;
    parameter s1 = 1;
    parameter s2 = 2;
    parameter s3 = 3;


    reg [1:0] state, next_state;

    always @(posedge clk) 
        begin
            if(reset)
            begin
                state = s0;
            end
            else
                state = next_state;
        end

    always @(*)
    begin
        
        case (state)
            s0:
                begin
                    if(sequence_in == 1)
                    begin
                        alarm = 0;
                        lockSys = 0;
                        next_state = s0;
                    end
                    else
                    begin // if sequence_in = 0
                        lockSys = 0;
                        alarm = 0;
                        next_state = s1;
                    end
                end

            s1:           
                begin
                    if(sequence_in == 1)
                    begin
                        alarm = 0;
                        lockSys = 0;
                        next_state = s2;
                    end
                    else    // if sequence_in = 0
                    begin
                        lockSys = 0;
                        alarm = 1;
                        next_state = s0;
                    end
                end

            s2:           
                begin
                    if(sequence_in == 0)
                    begin
                        alarm = 0;
                        lockSys = 1;
                        next_state = s3;
                    end
                    else    // if sequence_in = 1
                    begin
                        lockSys = 0;
                        alarm = 1;
                        next_state = s0;
                    end
                end
            
            s3:
                begin
                    if(sequence_in == 0 )
                    begin
                        alarm = 0;
                        lockSys = 0;
                        next_state = s3;
                    end
                    else     // if sequence_in = 1
                    begin
                        lockSys = 0;
                        alarm = 1;
                        next_state = s0;
                    end
                end             
        endcase

    end
endmodule //electric_lock
module tst_lock;

	reg sequence_in,reset,clk;
	wire lockSys,alarm;
	
	
	electric_lock e1(sequence_in, reset, clk, lockSys,  alarm );
	initial	begin
		clk = 0;
		sequence_in = 0;
		#10 sequence_in= 1;
		#20 sequence_in = 0;
		#20 sequence_in= 0;
		#20 sequence_in= 1;
		#20 sequence_in= 0;
		#20 sequence_in= 1;
	end
	
	initial	begin		
		reset = 1;
		#10 reset = 0;			
	end			
	
	always 
		#10 clk = ~clk;	
		initial
$monitor($time, "----%b %b %b %b", sequence_in,lockSys, alarm, reset);
		
endmodule
