library verilog;
use verilog.vl_types.all;
entity mux2x1 is
    port(
        i               : in     vl_logic_vector(1 downto 0);
        s               : in     vl_logic;
        o               : out    vl_logic
    );
end mux2x1;
