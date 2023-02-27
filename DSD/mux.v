module mux2x1(I,S,O);
input [1:0]I;
input S;
output reg O;
always @(I,S)
	//if (~S)
		//O=I[0];
	//else
		//O=I[1];
		assign O = S?I[1]:I[0];
		
endmodule

module mux4x1(I,S,O);
input [3:0]I;
input [1:0]S;
output reg O;
always @(I,S)
//begin
	//case(S)
	//2'b00:O=I[0];
	//2'b01:O=I[1];
	//2'b10:O=I[2];
	//2'b11:O=I[3];
	//endcase	
	assign O=S[1]?(S[0]?I[3]:I[2]):(S[0]?I[1]:I[0]);
//end
endmodule

module mux4using2(I,S,O);
input [3:0]I;
input [1:0]S;
output O;
wire O_m1,O_m2;
mux2x1 m1({I[1],I[0]},S[0],O_m1);
mux2x1 m2({I[3],I[2]},S[0],O_m2);
mux2x1 m3({O_m1,O_m2},S[1],O);
endmodule
//test bench for mux4using2 
module top_mux4from2(O,I,S);
input O;
output [1:0]S;
output [3:0]I;
reg [1:0]S;
reg [3:0]I;
mux4using2 m11(I,S,O);
initial begin
$monitor("I3=%b I2=%b I1=%b I0=%b  S1=%b S0=%b Output=%b \n",I[3],I[2],I[1],I[0],S[1],S[0], O);
I=4'b0001; S=2'b00;
#10 
I=4'b0010; S=2'b01;
#10 
I=4'b0100; S=2'b10;
#10 
I=4'b1000; S=2'b11;
end
endmodule

module mux8x1(I,S,O);
input [7:0]I;
input [2:0]S;
output reg O;
always @(I,S)
//begin
	//case(S)
	//2'b00:O=I[0];
	//2'b01:O=I[1];
	//2'b10:O=I[2];
	//2'b11:O=I[3];
	//endcase	
	assign O=S[2]?(S[1]?(S[0]?I[7]:I[6]):(S[0]?I[5]:I[4])):(S[1]?(S[0]?I[3]:I[2]):(S[0]?I[1]:I[0]));
//end
endmodule

module test_mux(O,I,S);
input O;
output [2:0]S;
output [7:0]I;
reg [2:0]S;
reg [7:0]I;
initial begin
$monitor($time ,"\t I7=%b I6=%b I5=%b I4=%b I3=%b I2=%b I1=%b I0=%b S2=%b S1=%b S0=%b Output=%b \n ",I[7],I[6],I[5],I[4],I[3],I[2],I[1],I[0],S[2],S[1],S[0], O);
I=8'b00000001 ;S=3'b000;
#10 I=8'b00000010; S=3'b001;
#10 I=8'b00000100 ; S=3'b010;
#10  I=8'b00001000 ; S=3'b011;
#10 I=8'b00010000; S=3'b100;
#10 I=8'b00100000 ; S=3'b101;
#10  I=8'b01000000 ; S=3'b110;
#10 I=8'b10000000; S=3'b111; 
end
endmodule
 
module top_mux();
wire [3:0]I;
wire [1:0]S;
wire O;
//mux8x1 mx(I,S,O);
//test_mux mt(O,I,S);
mux4using2 m11(I,S,O);
top_mux4from2 top1(O,I,S);
endmodule


		
