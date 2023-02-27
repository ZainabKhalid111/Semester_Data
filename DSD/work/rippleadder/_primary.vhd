library verilog;
use verilog.vl_types.all;
entity rippleadder is
    port(
        x               : in     vl_logic_vector(3 downto 0);
        y               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        carry           : out    vl_logic
    );
end rippleadder;
