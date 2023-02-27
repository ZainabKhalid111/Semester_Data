library verilog;
use verilog.vl_types.all;
entity test_rc is
    port(
        clock           : out    vl_logic;
        reset           : out    vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end test_rc;
