module ROM_16x8 (cs, addrb, datab, read_en);

	input [3:0] addrb;
	output [7:0] datab;
	input cs, read_en;
	
	wire [7:0] datab1, datab2;
	wire [1:0] OUT;
	
	assign OUT[0] = ~addrb[3];
	assign OUT[1] = addrb[3];
	
	ROM1_8x8 rc1 (OUT[0], addrb[2:0], datab1, read_en);
	ROM2_8x8 rc2 (OUT[1], addrb[2:0], datab2, read_en);
	
	assign datab = (cs && read_en)?datab1 | datab2:8'bz;
	
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

module tst_ROM_16x8;

	reg [3:0] addrb;
	wire [7:0] datab;
	reg cs, read_en;
	
	ROM_16x8 rom (cs, addrb, datab, read_en);
	
	initial begin
		#5 addrb =  0; 	//0 000
		#10 addrb = 7; 	//0 111
		#10 addrb = 8; 	//1 000
		#5 addrb = 15; 	//1 111
		#5 addrb = 14; 	//1 110
		#5 addrb = 11; 	//1 011
		#5 addrb = 12; 	//1 100
		#5 addrb = 9; 	 //1 001
	end
	
	initial begin
		cs = 1;
		read_en <= 1;		
	end

endmodule

