module halfadder(
input a,
input b,
output s,
output c
);
xor x1(s,a,b);
and a1(c,a,b);
endmodule

module fulladder(a,b,cin,cout,sum);
input a,b,cin;
output cout,sum;
wire c,s,c2;
halfadder h1(a,b,s,c);
halfadder h2(s,cin,sum,c2);
or o1(cout,c,c2);
endmodule

module test_bench();
reg a,b,cin;
wire s,cout;
fulladder f1(a,b,cin,cout,sum);
//halfadder h1(.x(a),.y(b),.sum(s),.carry(c));
initial
begin
a=0;b=0;cin=0;
#10
a=0;b=1;
#10
a=1;b=0;
#10
a=1;b=1;
end
initial
begin
	$monitor("A=%b B=%b Cin=%b  C=%b S=%b \n",a,b,cin,cout,sum);
end
endmodule
