library verilog;
use verilog.vl_types.all;
entity rom_32x8 is
    port(
        addrb           : in     vl_logic_vector(4 downto 0);
        datab           : out    vl_logic_vector(7 downto 0);
        read_en         : in     vl_logic
    );
end rom_32x8;
