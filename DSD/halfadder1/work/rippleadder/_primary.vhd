library verilog;
use verilog.vl_types.all;
entity rippleadder is
    port(
        cout            : out    vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic
    );
end rippleadder;
