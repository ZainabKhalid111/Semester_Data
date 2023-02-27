
module Decoder(
    inL, outL, memEn
);
    input           inL;
    output  reg [1:0]   outL;
    input           memEn;

    always @(inL) begin
        if (memEn == 1'b1) begin
            case (inL)
            1'b0 : 
                begin 
                    outL[0] = 1'b1;
                    outL[1] = 1'b0;
                end
            1'b1 :                
                begin 
                    outL[0] = 1'b0;
                    outL[1] = 1'b1;
                end
        endcase
        end
    end
endmodule

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



module Problem_01;

wire [7:0] lsb, msb, dataOut;
wire [1:0] CS;		

reg memEnbl, RandW;
reg [7:0] dataIN;	
reg [10:0] ADDR;

Decoder Decoder_1X2 (ADDR[10],   CS,     memEnbl);

RAM1 ramONE(ADDR[9:0],     CS[0],      RandW,     dataIN,     lsb);	

RAM2 ramTwo(ADDR[9:0],     CS[1],      RandW,     dataIN,     msb); 

assign dataOut = (lsb | msb);	

    initial 
    begin
        ADDR = 11'd1;
        memEnbl = 1'b1;
        RandW = 1'b1;
        #10 ADDR = 11'd1;
        #10 RandW = 1'b1;
        #10 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);

        #10 ADDR = 11'd25;

        #10 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);

        #10 ADDR = 11'd54;

        #10 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);

        //10000000001
        #10 ADDR = 11'd1023;

        #10 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);

        #10 ADDR = 11'd231;

        #10 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);

        #10 ADDR = 11'd1000;
        #10 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);

        #10 dataIN = 8'd1011;
        #10 $display("Address =  %d  --- Byte = %h", dataIN, ADDR);

        #10 RandW = 1'b1;
        #5 $display("Address =  %d  --- Byte = %h", ADDR, dataOut);
    end
endmodule
