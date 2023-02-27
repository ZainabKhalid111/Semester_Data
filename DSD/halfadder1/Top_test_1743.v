
module combine_test(CLK,RST,OUTPUT_DATA);//start of module combine_test
input [15:0] OUTPUT_DATA; //16 bit intput
output CLK,RST;	//1 bit output 
reg CLK,RST; //registers for temporary storing values but not physically registers
always 
	#10 CLK=~CLK; 
	initial 
	begin	//for executing multiple line statements
	CLK=1'b0;
	RST =  1'b0;
	#20 RST = 1'b1; 
	end
initial
	$monitor($time,		"RESET = %b 			OUT_DATA = %b",		RST,	OUTPUT_DATA[15:0]); //displaying result
endmodule

