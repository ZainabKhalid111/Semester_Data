module Decoder(
    in_line, out_line, memory_en
);
    input           in_line;
    output  reg [1:0]   out_line;
    input           memory_en;

    always @(in_line) begin
        if (memory_en == 1'b1) begin
            case (in_line)
            1'b0 : 
                begin 
                    out_line[0] = 1'b1;
                    out_line[1] = 1'b0;
                end
            1'b1 :                
                begin 
                    out_line[0] = 1'b0;
                    out_line[1] = 1'b1;
                end
        endcase
        end
    end
endmodule

// This module has ben Given in Practice Problem 03
module RAM1 (addr, CS, RW, idata, odata);
    input CS, RW;
    input [9:0] addr;
    input [7:0] idata;
    output [7:0] odata;
    reg [7:0] d_out;
    reg [7:0] Mem1 [0:1023];
    assign odata = (CS && RW) ? d_out : 8'd0;
    
    always @(addr or idata or CS or RW)
        if (CS && !RW)
            Mem1 [addr] = idata;
    always @(addr or CS or RW)
        if (CS && RW)
            d_out = Mem1 [addr];
    initial
        $readmemh("memory1.dat", Mem1);
endmodule

// This module has ben Given in Practice Problem 03
module RAM2 (addr, CS, RW, idata, odata);
    input CS, RW;
    input [9:0] addr;
    input [7:0] idata;
    output [7:0] odata;
    reg [7:0] d_out;
    reg [7:0] Mem2 [0:1023];

    assign odata = (CS && RW)?d_out:8'd0;

    always @(addr or idata or CS or RW)
        if (CS && !RW)
            Mem2 [addr] = idata;
    always @(addr or CS or RW)
        if (CS && RW)
            d_out = Mem2 [addr];
    initial
        $readmemh ("memory2.dat", Mem2);
endmodule



module top;

wire [7:0] out_LSB, out_MSB, output_data;
wire [1:0] CS;		

reg memory_enable, read_write;
reg [7:0] input_data;	
reg [10:0] addr_lines_;

//module Decoder( in_line, out_line, memory_en );
Decoder Decoder_1X2 (addr_lines_[10],   CS,     memory_enable);

//module RAM1 (addr, CS, RW, idata, odata);
RAM1 memory_1(addr_lines_[9:0],     CS[0],      read_write,     input_data,     out_LSB);	

//module RAM2 (addr, CS, RW, idata, odata);
RAM2 memory_2(addr_lines_[9:0],     CS[1],      read_write,     input_data,     out_MSB); 

assign output_data = (out_LSB | out_MSB);	

    initial 
    begin
        addr_lines_ = 11'd1;
        memory_enable = 1'b1;
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



// ** Test Bench for Decoder ***///////
// module tb;
//     wire [1:0] out_line;
//     reg in_line;
//     wire memory_en;

//     assign memory_en = 1'b1;

//     Decoder Dec(in_line, out_line, memory_en);

//     always begin
//             in_line = 1'b0;
//             #10;
//             in_line = 1'b1;
//             #10;
//     end
// endmodule
