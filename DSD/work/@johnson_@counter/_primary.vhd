library verilog;
use verilog.vl_types.all;
entity johnson_counter is
    port(
        clk             : in     vl_logic;
        clr             : in     vl_logic;
        count           : out    vl_logic_vector(3 downto 0)
    );
end johnson_counter;
