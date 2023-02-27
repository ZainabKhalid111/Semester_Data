library verilog;
use verilog.vl_types.all;
entity combine_test is
    port(
        clk             : out    vl_logic;
        rst             : out    vl_logic;
        output_data     : in     vl_logic_vector(15 downto 0)
    );
end combine_test;
