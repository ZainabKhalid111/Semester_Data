module SUM (S, A, B);
	output S;
	input A, B;
	xor x1 (S, A, B);
endmodule

module CARRY (C, A, B);
	output C;
	input A, B;
	and a1 (C, A, B);
endmodule


module halfadder1(C,S,A,B);
input A,B;
output C,S;
SUM s1(S,A,B);	//calling sum block
CARRY c1(C,A,B);	//calling carry block  
endmodule

module fulladder(Co,Sum,Cin,A,B);
input Cin,A,B;
output Co,Sum;
wire S2,C,C2;
halfadder1 h1(C,S,A,B);
halfadder1 h2(C2,S2,Cin,S); 
or o1(Co,C,C2);
buf b1(Sum,S2);
endmodule

module rippleaddder(Cout, S, A, B,Cin);

	output Cout;
	output [3:0] S;
	input [3:0] A, B;
	input Cin;
	wire [2:0] C;   //Intermediate/Internal Carries

	//fulladder fa(Co,Sum,Cin,A,B);    //FA1's Interface (I/O Pins)

	FA1 fa0 (S[0], C[0], A[0], B[0], 1'b0);
	FA1 fa1 (S[1], C[1], A[1], B[1], C[0]);
	FA1 fa2 (S[2], C[2], A[2], B[2], C[1]);
	FA1 fa3 (S[3], Cout, A[3], B[3], C[2]);

endmodule

module test_rippleadder();	//test bench
reg Cin;	//1 bits input
reg [3:0]A,B;	//4 bits inputs 
wire Cout;	//1 bits output
wire [3:0]S;	//4 bits outputs 
rippleaddder	r(Cout, S, A, B,Cin);
initial
	begin
	$display("A					B		Cin		Sum			Cout");
	A=4'b0000;B=4'b0000;Cin=1'b0;
	#100 
	$display("%d	%d	%d	%d	%d",A,B,Cin,S,Cout);
	A=4'b0010;B=4'b0010;Cin=1'b0;
	#100
	$display("%d	%d	%d	%d	%d",A,B,Cin,S,Cout);
	A=4'b0010;B=4'b0100;Cin=1'b1;
	#100
	$display("%d	%d	%d	%d	%d",A,B,Cin,S,Cout);
	A=4'b0110;B=4'b1010;Cin=1'b0;
	#100
	$display("%d	%d	%d	%d	%d",A,B,Cin,S,Cout);
	A=4'b1111;B=4'b1111;Cin=1'b1;
	#100
	$display("%d	%d	%d	%d	%d",A,B,Cin,S,Cout);
	end
	
//initial
	//begin
	//$monitor("A=%b		B=%b		Cin=%b		Sum=%b		Cout=%b",A,B,Cin,S,Cout);
	//end 
endmodule



