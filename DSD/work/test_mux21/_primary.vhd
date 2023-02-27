library verilog;
use verilog.vl_types.all;
entity test_mux21 is
    port(
        \OUT\           : in     vl_logic;
        i               : out    vl_logic_vector(1 downto 0);
        sel             : out    vl_logic
    );
end test_mux21;
