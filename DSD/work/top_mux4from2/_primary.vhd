library verilog;
use verilog.vl_types.all;
entity top_mux4from2 is
    port(
        o               : in     vl_logic;
        i               : out    vl_logic_vector(3 downto 0);
        s               : out    vl_logic_vector(1 downto 0)
    );
end top_mux4from2;
