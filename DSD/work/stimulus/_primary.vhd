library verilog;
use verilog.vl_types.all;
entity stimulus is
    port(
        q               : in     vl_logic_vector(3 downto 0);
        t               : out    vl_logic;
        clock           : out    vl_logic;
        reset           : out    vl_logic
    );
end stimulus;
