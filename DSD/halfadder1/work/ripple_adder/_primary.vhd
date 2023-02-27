library verilog;
use verilog.vl_types.all;
entity ripple_adder is
    port(
        cout            : out    vl_logic;
        s               : out    vl_logic_vector(3 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0)
    );
end ripple_adder;
