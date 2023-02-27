library verilog;
use verilog.vl_types.all;
entity ripple_counter is
    port(
        q               : out    vl_logic_vector(3 downto 0);
        clock           : in     vl_logic;
        reset           : in     vl_logic
    );
end ripple_counter;
