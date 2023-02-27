library verilog;
use verilog.vl_types.all;
entity bcd is
    port(
        clock           : in     vl_logic;
        clr             : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end bcd;
