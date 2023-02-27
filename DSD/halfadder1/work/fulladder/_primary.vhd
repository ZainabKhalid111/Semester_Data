library verilog;
use verilog.vl_types.all;
entity fulladder is
    port(
        co              : out    vl_logic;
        sum             : out    vl_logic;
        cin             : in     vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end fulladder;
