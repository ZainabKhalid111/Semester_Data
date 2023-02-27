library verilog;
use verilog.vl_types.all;
entity ram1 is
    port(
        addr            : in     vl_logic_vector(9 downto 0);
        cs              : in     vl_logic;
        rw              : in     vl_logic;
        idata           : in     vl_logic_vector(7 downto 0);
        odata           : out    vl_logic_vector(7 downto 0)
    );
end ram1;
