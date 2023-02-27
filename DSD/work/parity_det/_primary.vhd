library verilog;
use verilog.vl_types.all;
entity parity_det is
    generic(
        even            : integer := 0;
        odd             : integer := 1
    );
    port(
        x               : in     vl_logic;
        clk             : in     vl_logic;
        z               : out    vl_logic
    );
end parity_det;
