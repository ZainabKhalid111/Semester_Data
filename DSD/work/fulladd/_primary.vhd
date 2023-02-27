library verilog;
use verilog.vl_types.all;
entity fulladd is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic;
        cin             : in     vl_logic;
        sum             : out    vl_logic;
        carry           : out    vl_logic
    );
end fulladd;
