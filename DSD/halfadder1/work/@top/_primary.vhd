library verilog;
use verilog.vl_types.all;
entity top is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        output_data     : out    vl_logic_vector(15 downto 0)
    );
end top;
