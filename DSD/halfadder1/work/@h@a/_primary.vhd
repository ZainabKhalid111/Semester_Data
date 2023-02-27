library verilog;
use verilog.vl_types.all;
entity ha is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        s               : out    vl_logic;
        c               : out    vl_logic
    );
end ha;
