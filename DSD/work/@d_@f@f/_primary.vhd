library verilog;
use verilog.vl_types.all;
entity d_ff is
    port(
        q               : out    vl_logic;
        d               : in     vl_logic;
        clock           : in     vl_logic;
        reset           : in     vl_logic
    );
end d_ff;
