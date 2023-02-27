
module Top (CLK, RESET, OUTPUT_DATA); //top level module 
input CLK, RESET; 	//1 bit inputs 
output [15:0] OUTPUT_DATA; //16 bit output
//Place your code here
combine c1(RST,CLK,OUTPUT_DATA); //calling combine module
combine_test ct(CLK,RST,OUTPUT_DATA);	//calling combine_test module
endmodule //end of top module
