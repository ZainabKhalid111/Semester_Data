library verilog;
use verilog.vl_types.all;
entity test_johnson is
    port(
        clk             : out    vl_logic;
        clr             : out    vl_logic;
        count           : out    vl_logic_vector(3 downto 0)
    );
end test_johnson;
