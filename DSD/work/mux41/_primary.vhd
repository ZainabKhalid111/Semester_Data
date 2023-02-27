library verilog;
use verilog.vl_types.all;
entity mux41 is
    port(
        \OUT\           : out    vl_logic;
        i               : in     vl_logic_vector(3 downto 0);
        sel             : in     vl_logic_vector(1 downto 0)
    );
end mux41;
