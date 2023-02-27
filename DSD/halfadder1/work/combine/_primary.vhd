library verilog;
use verilog.vl_types.all;
entity combine is
    port(
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        output_data     : out    vl_logic_vector(15 downto 0)
    );
end combine;
