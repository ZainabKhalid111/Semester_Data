library verilog;
use verilog.vl_types.all;
entity electric_lock is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2;
        s3              : integer := 3
    );
    port(
        sequence_in     : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        locksys         : out    vl_logic;
        alarm           : out    vl_logic
    );
end electric_lock;
