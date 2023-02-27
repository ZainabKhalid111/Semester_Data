library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        in_line         : in     vl_logic;
        out_line        : out    vl_logic_vector(1 downto 0);
        memory_en       : in     vl_logic
    );
end decoder;
