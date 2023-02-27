module halfadd(x,y,s,c);
input x,y;
output s,c;
and a1(c,x,y);
xor x1(s,x,y);
endmodule

module fulladd(x,y,cin,sum,carry);
input x,y,cin;
output sum,carry;
wire s1,c1,c2;
halfadd ha1(x,y,s1,c1);
halfadd ha2(s1,cin,sum,c2);
or o1(carry,c1,c2);
endmodule

module rippleadder(x,y,cin,sum,carry);
input[3:0]x,y;
output [3:0] sum;
output carry;
input cin;
fulladd f1(x[0],y[0],cin,sum[0],c0);
fulladd f2(x[1],y[1],c0,sum[1],c1);
fulladd f3(x[2],y[2],c1,sum[2],c2);
fulladd f4(x[3],y[3],c2,sum[3],carry);
endmodule

module test_bench();
reg [3:0]x,y;
reg cin;
wire [3:0]sum;
wire carry;
rippleadder rp(x,y,cin,sum,carry);
initial
begin
//$display("x,y,c,s");
//#5
//x=0;y=0;
//#5 $display(" %b	%b	%b %b",x,y,c,s);

//x=0;y=1;
//#5 $display(" %b	%b	%b %b",x,y,c,s);

//x=1;y=0;
//#5 $display(" %b	%b	%b %b",x,y,c,s);

//x=1;y=1;
//#5 $display(" %b	%b	%b %b",x,y,c,s);

$monitor($time,"\t X=%b 		Y=%b	 Cin=%b 		Cout=%b		Sum=%b \n",x,y,cin,carry,sum);

x=4'd0;y=4'd0;cin=1'd0;
#5 
x=4'd2;y=4'd2;cin=1'd0;
#5
x=4'd5;y=4'd2;cin=1'd0;
#5
x=4'd3;y=4'd3;cin=1'd0;
#5
x=4'd7;y=4'd9;cin=1'd0;
end
endmodule

module ADD16 (A, B, S, C);
input [15:0] A, B;
output [15:0] S;
output C;
assign {C, S} = A+B;
endmodule

module Mazzay;
// Inputs
reg [15:0] inputA, inputB;

// Outputs
wire [15:0] Sum;
wire Carr;
// Instantiate the Unit Under Test (UUT)
ADD16 dut (inputA, inputB, Sum, Carr);
initial begin
// Initialize Inputs
inputA = 16&#39;hFFFF;
inputB = 16&#39;hFFFF;
#10
inputA = 16&#39;hABCD;
inputB = 16&#39;h0000;
#10
inputA = 16&#39;h9111;
inputB = 16&#39;h8765;
end
endmodule

