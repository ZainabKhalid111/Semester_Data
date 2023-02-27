module rippleadder(cout,sum,a,b,cin);
input cin;	//1 bits input
input [3:0]a,b;//4 bits inputs
output cout;	////1 bits output 
output [3:0]sum;	//4 bits outputs
assign {cout,sum}=a+b+cin;	//behavioral modeling
endmodule

module stim_ripple();	//test bench
reg cin;	//1 bits input
reg [3:0]a,b;	//4 bits inputs 
wire cout;	//1 bits output
wire [3:0]sum;	//4 bits outputs 
rippleadder ra(cout,sum,a,b,cin);
initial
	begin
	$display("A		B	Cin		Sum		Cout");
	a=4;b=6;cin=1'b0;
	#10
	$display("%d	%d	 %d			%d			%d",a,b,cin,sum,cout);
	a=11;b=5;cin=1'b0;
	#10
	$display("%d	%d	 %d			%d			%d",a,b,cin,sum,cout);
	a=9;b=3;cin=1'b0;
	#10
	$display("%d	%d	%d			%d			%d",a,b,cin,sum,cout);
	a=2;b=1;cin=1'b0;
	#10
	$display("%d	%d	 %d			%d			%d",a,b,cin,sum,cout);
	a=5;b=3;cin=1'b0;
	#10
	$display("%d	%d	 %d			%d			%d",a,b,cin,sum,cout);
	end
	
//initial
	//begin
	//$monitor("A=%b		B=%b		Cin=%b		Sum=%b		Cout=%b",a,b,cin,sum,cout);
	//end 
endmodule


