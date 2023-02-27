library verilog;
use verilog.vl_types.all;
entity halfadder2 is
    port(
        c2              : out    vl_logic;
        s2              : out    vl_logic;
        cin             : in     vl_logic;
        s               : in     vl_logic
    );
end halfadder2;
