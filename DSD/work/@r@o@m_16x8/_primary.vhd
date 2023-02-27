library verilog;
use verilog.vl_types.all;
entity rom_16x8 is
    port(
        cs              : in     vl_logic;
        addrb           : in     vl_logic_vector(3 downto 0);
        datab           : out    vl_logic_vector(7 downto 0);
        read_en         : in     vl_logic
    );
end rom_16x8;
