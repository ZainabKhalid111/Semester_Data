library verilog;
use verilog.vl_types.all;
entity halfadd is
    port(
        x               : in     vl_logic;
        y               : in     vl_logic;
        s               : out    vl_logic;
        c               : out    vl_logic
    );
end halfadd;
