
module JS_Counter (CLK, CLR, Q);
input CLK, CLR; //1 bit inputs
output [3:0] Q; //4 bit output
//Place your code here
wire Qo_4;
DFF dff1(Qo_4,CLK,CLR,Q[0],Qo_1); //instantiating decoder 
DFF dff2(Q[0],CLK,CLR,Q[1],Qo_2);
DFF dff3(Q[1],CLK,CLR,Q[2],Qo_3);
DFF dff4(Q[2],CLK,CLR,Q[3],Qo_4);
endmodule

