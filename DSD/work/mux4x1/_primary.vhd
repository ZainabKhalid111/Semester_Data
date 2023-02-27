library verilog;
use verilog.vl_types.all;
entity mux4x1 is
    port(
        i               : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0);
        o               : out    vl_logic
    );
end mux4x1;
