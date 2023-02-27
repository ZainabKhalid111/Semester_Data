
module combine(RST,CLK,OUTPUT_DATA);
input  RST,CLK; //1 bit input
output [15:0] OUTPUT_DATA; //16 bit output
wire en; 
wire [3:0]Q; //4 bit wire
assign en=1;
JS_Counter jsc(CLK,RST,Q); //calling JS_Counter module 
Dec_4x16 d1(Q[3],Q[2],Q[1],Q[0],en,OUTPUT_DATA); //calling Dec_4x16 module 
endmodule

