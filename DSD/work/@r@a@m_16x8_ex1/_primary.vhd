library verilog;
use verilog.vl_types.all;
entity ram_16x8_ex1 is
    port(
        clk             : in     vl_logic;
        addr            : in     vl_logic_vector(3 downto 0);
        rw              : in     vl_logic;
        i_data          : in     vl_logic_vector(7 downto 0);
        o_data          : out    vl_logic_vector(7 downto 0)
    );
end ram_16x8_ex1;
