library verilog;
use verilog.vl_types.all;
entity fsm_lock_mealys is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2;
        s3              : integer := 3
    );
    port(
        \IN\            : in     vl_logic;
        r               : in     vl_logic;
        clk             : in     vl_logic;
        lock            : out    vl_logic;
        alarm           : out    vl_logic
    );
end fsm_lock_mealys;
