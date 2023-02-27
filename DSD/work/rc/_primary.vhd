library verilog;
use verilog.vl_types.all;
entity rc is
    port(
        clk             : in     vl_logic;
        init            : in     vl_logic;
        count           : out    vl_logic_vector(7 downto 0)
    );
end rc;
