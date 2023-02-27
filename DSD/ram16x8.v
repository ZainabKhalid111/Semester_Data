module RAM_16x8_ex1 (clk, addr, RW, i_data, o_data);
	
	input clk;
    	input [3:0] addr;
    	input RW;
    	input [7:0] i_data;
    	output reg[7:0] o_data;
    	
    	reg [7:0] Mem [0:15]; 
	
    	always @ (posedge clk)
    	     	if (RW) 
            			Mem[addr] <= i_data;
        		else 
            			o_data <= Mem[addr];
        		   
endmodule


