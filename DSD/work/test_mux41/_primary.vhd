library verilog;
use verilog.vl_types.all;
entity test_mux41 is
    port(
        \OUT\           : in     vl_logic;
        i               : out    vl_logic_vector(3 downto 0);
        sel             : out    vl_logic_vector(1 downto 0)
    );
end test_mux41;
