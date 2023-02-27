library verilog;
use verilog.vl_types.all;
entity three_bcd is
    port(
        clock           : in     vl_logic;
        clr             : in     vl_logic;
        bcdu            : out    vl_logic_vector(3 downto 0);
        bcdt            : out    vl_logic_vector(3 downto 0);
        bcdh            : out    vl_logic_vector(3 downto 0)
    );
end three_bcd;
