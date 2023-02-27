library verilog;
use verilog.vl_types.all;
entity fsm_two1s_moore1 is
    generic(
        a               : integer := 0;
        b               : integer := 1;
        c               : integer := 2
    );
    port(
        \IN\            : in     vl_logic;
        \OUT\           : out    vl_logic;
        r               : in     vl_logic;
        ck              : in     vl_logic
    );
end fsm_two1s_moore1;
