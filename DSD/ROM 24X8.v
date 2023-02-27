
module ROM_24x8 (cs, addrb, datab, read_en);

	input [4:0] addrb;
	output [7:0] datab;
	input cs, read_en;
	
	wire [7:0] datab1, datab2, datab3;
	wire [3:0] OUT;
	
	Dec_24 d1 (addrb[4], addrb[3], OUT);
	
	ROM1_8x8 rc1 (OUT[0], addrb[2:0], datab1, read_en);
	ROM2_8x8 rc2 (OUT[1], addrb[2:0], datab2, read_en);
	ROM3_8x8 rc3 (OUT[2], addrb[2:0], datab3, read_en);
	
	assign datab = (cs && read_en)?datab1 | datab2 | datab3:8'bz;
	
endmodule


module ROM1_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if  (read_en & cs)
			case (addrb)
				0: datab = 21;
				1: datab = 255;
				2: datab = 33;
				3: datab = 99;
				4: datab = 127;
				5: datab = 13;
				6: datab = 10;
				7: datab = 88;
			endcase
		else
			datab = 8'b0;

endmodule


module ROM2_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if (read_en & cs)
			case (addrb)
				0: datab = 28;
				1: datab = 38;
				2: datab = 48;
				3: datab = 58;
				4: datab = 68;
				5: datab = 78;
				6: datab = 88;
				7: datab = 98;
			endcase
		else
			datab = 8'b0;
		
endmodule

module ROM3_8x8 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (*)
		if (read_en & cs)
			case (addrb)
				0: datab = 128;
				1: datab = 138;
				2: datab = 148;
				3: datab = 158;
				4: datab = 168;
				5: datab = 178;
				6: datab = 188;
				7: datab = 198;
			endcase
		else
			datab = 8'b0;

endmodule

module Dec_24 (A, B, OUT);

	input A, B;
	output [3:0] OUT;
	
	assign OUT[0] = ~A & ~B;
	assign OUT[1] = ~A & B;
	assign OUT[2] = A & ~B;
	assign OUT[3] = A & B;
	
endmodule

module tst_ROM_24x8;

	reg [4:0] addrb;
	wire [7:0] datab;
	reg cs, read_en;
	
	ROM_24x8 rom (cs, addrb, datab, read_en);
	
	initial begin
		#5 addrb =  0; 	//00 000
		#10 addrb = 7; 	//00 111
		#10 addrb = 8; 	//01 000
		#5 addrb = 15; 	//01 111
		#5 addrb = 14; 	//01 110
		#5 addrb = 11; 	//01 011
		#5 addrb = 12; 	//01 100
		#5 addrb = 9; 	 //01 001
		#5 addrb = 16; 	//10 000
		#5 addrb = 23; 	//10 111
		#5 addrb = 20; 	//10 100
	end
	
	initial begin
		cs = 1;
		read_en <= 1;		
	end

endmodule



