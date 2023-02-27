library verilog;
use verilog.vl_types.all;
entity bcd_test is
    port(
        clock           : out    vl_logic;
        clr             : out    vl_logic;
        q               : in     vl_logic_vector(3 downto 0)
    );
end bcd_test;
