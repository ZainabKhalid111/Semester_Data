
//given module RAM1
module RAM1 (addr, CS, RW, idata, odata);
input CS, RW;
 input [9:0] addr;
 input [7:0] idata;
 output [7:0] odata;
reg [7:0] d_out;
 reg [7:0] Mem1 [0:1023]; 
assign odata = (CS && RW)?d_out:8?bz;
 always @(addr or idata or CS or RW)
 if (CS && !RW) 
 Mem1 [addr] = idata;
 always @(addr or CS or RW)
 if (CS && RW) 
 d_out = Mem1 [addr];
initial
	$readmemh ("memory1.dat", Mem1);
endmodule

//given module RAM2
module RAM2 (addr, CS, RW, idata, odata);
input CS, RW;
 input [9:0] addr;
 input [7:0] idata;
 output [7:0] odata;
reg [7:0] d_out;
 reg [7:0] Mem2 [0:1023]; 
assign odata = (CS && RW)?d_out:8?bz;
 always @(addr or idata or CS or RW)
 if (CS && !RW) 
 Mem2 [addr] = idata;
 always @(addr or CS or RW)
 if (CS && RW) 
 d_out = Mem2 [addr];
initial
	$readmemh ("memory2.dat", Mem2);
endmodule

//1x2decoder module
module decoder1x2(in_addr,mem_en,out)
input in_addr,mem_en;
output [1:0]out;
reg [1:0]out;
always @(in_addr) 
 begin
        if (mem_en == 1'b1) 
            case (in_addr)
                    1'b0 :	out[0] = 1'b1;
		    1'b1 :	out[1] = 1'b1;
	    endcase
	else
	
end
endmodule

//top level module for combining two 1kx8 RAMs
module top_combine_1kx8;
reg mem_en, RW;
reg [7:0] idata;	
reg [10:0] address_lines_;
wire [7:0] output_RAM1, output_RAM2,output_data;
wire [1:0] CS;		

decoder1x2(address_lines[10],mem_en,CS);
RAM1 R1(address_lines[9:0], CS[0], RW, idata,output_RAM1);
RAM2 R2(address_lines[9:0], CS[1], RW, idata,output_RAM2);
assign output_data=output_RAM1|output_RAM2;
initial 
    begin
     	mem_en = 1'b1;
        address_lines_ = 11'd1;
        read_write = 1'b1;
        #10 addr_lines_ = 11'd1;
        #10 read_write = 1'b1;
        #10 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);

        #10 addr_lines_ = 11'd8;

        #10 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);

        #10 addr_lines_ = 11'd11;

        #10 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);

        //010000000001
        #10 addr_lines_ = 11'd1025;

        #10 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);

        #10 addr_lines_ = 11'd1030;

        #10 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);

        #10 addr_lines_ = 11'd1034;
        #10 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);

        #10 input_data = 8'd172;
        #10 $display("Address =  %d  ||| Byte = %h", input_data, addr_lines_);
        #10 read_write = 1'b0;
        #10 read_write = 1'b1;

        #5 $display("Address =  %d  ||| Byte = %h", addr_lines_, output_data);
    end
endmodule


//  Test Bench for Decoder
module test_decoder;
wire [1:0]out;
wire mem_en;
reg in_addr;    

assign memory_en = 1'b1; 
decoder1x2 d1(in_addr,mem_en,out)
always 
begin
	in_addr = 1'b0;
	#10;
	in_addr = 1'b1;
	#10;
end
endmodule

