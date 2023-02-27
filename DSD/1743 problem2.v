
//Given in Practice Problem 03
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

//Given in Practice Problem 03
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



module top_for_task_02;
    reg [9:0] ADDRL;
    reg CS, RandW;
    reg [15:0] dataIN;

    wire [15:0] dataOUT;
    wire [7:0] lsb, msb;


    RAM1 ramONE   (ADDRL,    CS,     RandW,     dataIN[7:0],    lsb);
    RAM2 ramTwo   (ADDRL,    CS,     RandW,     dataIN[15:8],   msb);

    assign dataOUT = ((msb << 8) | lsb);

    initial begin
        CS = 1'b1;
        RandW = 1'b1;

        ADDRL = 10'd231;
            #10 $display("Address =  %d  --- Byte = %h", ADDRL, dataOUT);

        ADDRL = 10'd112;
            #10 $display("Address =  %d  --- Byte = %h", ADDRL, dataOUT);

        RandW = 1'b0;
        dataIN = 16'h343A;
        #10 
        RandW = 1'b1;
            #10 $display("Address =  %d  --- Byte = %h", ADDRL, dataOUT);

        ADDRL = 10'd332;
            #10 $display("Address =  %d  --- Byte = %h", ADDRL, dataOUT);

        ADDRL = 10'd432;
            #10 $display("Address =  %d  --- Byte = %h", ADDRL, dataOUT);
            
        ADDRL = 10'd243;
            #10 $display("Address =  %d  --- Byte = %h", ADDRL, dataOUT);
    end
endmodule









