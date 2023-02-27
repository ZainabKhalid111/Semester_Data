library verilog;
use verilog.vl_types.all;
entity test_mux is
    port(
        o               : in     vl_logic;
        i               : out    vl_logic_vector(7 downto 0);
        s               : out    vl_logic_vector(2 downto 0)
    );
end test_mux;
