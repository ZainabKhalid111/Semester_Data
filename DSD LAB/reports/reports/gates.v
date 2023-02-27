module buffer(x,y);
input x;
output y;
buf b1(y,x);
endmodule

module test();
reg x;
wire y;
buffer b1(x,y);
initial 
begin
$display("x y");
x=0;
#1 $display("%b %b",x,y);
x=1;
#1 $display("%b %b",x,y);
end
endmodule
