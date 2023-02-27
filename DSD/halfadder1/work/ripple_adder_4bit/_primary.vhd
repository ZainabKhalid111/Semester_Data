library verilog;
use verilog.vl_types.all;
entity ripple_adder_4bit is
    port(
        cout            : out    vl_logic;
        sum             : out    vl_logic_vector(3 downto 0);
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        cin             : in     vl_logic
    );
end ripple_adder_4bit;
