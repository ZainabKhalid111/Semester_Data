module electLock(openLock, alarm, code, clk, rst);
output openLock, alarm;
input code, clk, rst;
reg openLock, alarm;
reg [2:0] PS, NS;
reg a;
parameter A = 3'd0, B = 3'd1, C = 3'd2, D = 3'd3, E = 3'd4;
always @(posedge clk, rst)
	if(rst)
		begin
		PS <= A;
		a = 1;
		end
	else
		PS <= NS;
always @(PS or code)
	case(PS)
	A:
		begin
		alarm = a;
		openLock = 1'b0;
		NS = (code == 0)?B:E;
		end
	B:
		begin
		alarm = a;
		openLock = 1'b0;
		NS = (code)?C:E;
		end
	C:
		begin
		
		a = (code == 0)?0:1;
		alarm = a;
		openLock = (code == 0)?1'b1:1'b0;
		NS = (code== 0)?D:E;
		end
	D:
		begin
		alarm = a;
		openLock = 1'b0;
		NS = A;
		end
	E:
		begin
		
		a = 1'b1;
		alarm = a;
		openLock = 1'b0;
		NS = (code)?A:B;
		end
	endcase
endmodule

module electlocktest;
reg code, clk, rst;
wire openLock, alarm;

electLock el(openLock, alarm, code, clk, rst);
initial begin
 clk = 0;
 code = 0;
#10 code = 1;	//0
#20 code = 0;	//1
#20 code = 0; //move to initial state without setting alarm
#20 code = 1;
#20 code = 0;
#20 code = 1;
#20 code = 0;
#20 code = 1;
#20 code = 0;

end

initial 
begin
	rst = 1;
	#10 rst = 0;
end
always
	#10 clk = ~clk;

initial
$monitor($time, "  ->  %b %b %b %b", code,openLock, alarm, rst);

endmodule

