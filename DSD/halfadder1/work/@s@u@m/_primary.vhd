library verilog;
use verilog.vl_types.all;
entity sum is
    port(
        s               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic;
        cin             : in     vl_logic
    );
end sum;
