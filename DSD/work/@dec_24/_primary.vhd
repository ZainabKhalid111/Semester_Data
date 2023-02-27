library verilog;
use verilog.vl_types.all;
entity dec_24 is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        \OUT\           : out    vl_logic_vector(3 downto 0)
    );
end dec_24;
