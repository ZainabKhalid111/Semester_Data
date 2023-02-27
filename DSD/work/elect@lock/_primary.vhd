library verilog;
use verilog.vl_types.all;
entity electlock is
    generic(
        a               : integer := 0;
        b               : integer := 1;
        c               : integer := 2;
        d               : integer := 3;
        e               : integer := 4
    );
    port(
        openlock        : out    vl_logic;
        alarm           : out    vl_logic;
        code            : in     vl_logic;
        clk             : in     vl_logic;
        rst             : in     vl_logic
    );
end electlock;
