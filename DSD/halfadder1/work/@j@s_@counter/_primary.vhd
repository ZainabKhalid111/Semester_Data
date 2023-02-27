library verilog;
use verilog.vl_types.all;
entity js_counter is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        q               : out    vl_logic_vector(3 downto 0)
    );
end js_counter;
