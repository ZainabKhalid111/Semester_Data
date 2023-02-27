library verilog;
use verilog.vl_types.all;
entity halfadder1 is
    port(
        c               : out    vl_logic;
        s               : out    vl_logic;
        a               : in     vl_logic;
        b               : in     vl_logic
    );
end halfadder1;
