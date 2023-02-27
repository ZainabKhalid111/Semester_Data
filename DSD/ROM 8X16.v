
module ROM_8x16 (cs, addrb, datab, read_en);

	input [3:0] addrb;
	output [15:0] datab;
	input cs, read_en;
	
	wire [7:0] datab1, datab2;
	
	ROM1_8x8 rc1 (cs, addrb, datab1, read_en);
	ROM2_8x8 rc2 (cs, addrb, datab2, read_en);
	
	assign datab = (cs && read_en)?{datab2, datab1}:8'bz;
	
endmodule

module ROM1_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if  (read_en & cs)
			case (addrb)
				0: datab = 8'h21;
				1: datab = 8'hab;
				2: datab = 8'h33;
				3: datab = 8'h99;
				4: datab = 8'ha3;
				5: datab = 8'hff;
				6: datab = 8'hcd;
				7: datab = 8'h88;
			endcase
		else
			datab = 8'bz;

endmodule

module ROM2_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if (read_en & cs)
			case (addrb)
				0: datab = 8'h2e;
				1: datab = 8'h38;
				2: datab = 8'h4c;
				3: datab = 8'h58;
				4: datab = 8'h68;
				5: datab = 8'h7f;
				6: datab = 8'h88;
				7: datab = 8'h9a;
			endcase
		else
			datab = 8'bz;
		
endmodule

module tst_ROM_8x16;

	reg [3:0] addrb;
	wire [15:0] datab;
	reg cs, read_en;
	
	ROM_8x16 rom (cs, addrb, datab, read_en);
	
	initial begin
		#5 addrb =  0; 
		#10 addrb = 7;
		#10 addrb = 5;
		#5 addrb = 4; 
		#5 addrb = 6;
		#5 addrb = 1; 
		#5 addrb = 2;
		#5 addrb = 3;
		
	end
	
	initial begin
		cs = 1;
		read_en <= 1;		
	end

endmodule