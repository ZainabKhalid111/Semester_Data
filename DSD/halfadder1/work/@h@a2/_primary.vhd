library verilog;
use verilog.vl_types.all;
entity ha2 is
    port(
        su              : out    vl_logic;
        ca              : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end ha2;
