module ROM_v1 (cs, addrb, datab, read_en);

	input [2:0] addrb;
	output [7:0] datab;
	input read_en, cs;
	
	reg [7:0] datab;
	
	always @ (addrb)
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
			datab = 8'bz;

endmodule

module tst_ROM_v1;

	reg [2:0] addrb;
	wire [7:0] datab;
	reg read_en, cs;  
	
	ROM_v1 rom1 (cs, addrb, datab, read_en);
	
	initial begin
		#0 addrb = 2;
		#10 addrb = 5;
		#10 addrb = 3;
		#5 addrb = 7;
	end
	initial begin
		#3 cs <= 1;
	end
	initial begin
		#3 read_en <= 1;
	end

endmodule

module ROM_v2 (cs, addrb, datab, read_en);

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
			datab = 8'bz;

endmodule

module tst_ROM_v2;

	reg [2:0] addrb;
	wire [7:0] datab;
	reg read_en, cs;
	
	ROM_v2 rom1 (cs, addrb, datab, read_en);
	
	initial begin
		#0 addrb = 2;
		#10 addrb = 5;
		#10 addrb = 3;
		#5 addrb = 7;
	end
	initial begin
		#3 cs <= 1;
	end
	initial begin
		#3 read_en <= 1;
	end

endmodule


