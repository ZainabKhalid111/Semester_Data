library verilog;
use verilog.vl_types.all;
entity traffic_lights1 is
    generic(
        s0              : integer := 0;
        s1              : integer := 1;
        s2              : integer := 2;
        red             : integer := 4;
        green           : integer := 2;
        yellow          : integer := 1
    );
    port(
        clk             : in     vl_logic;
        light           : out    vl_logic_vector(2 downto 0)
    );
end traffic_lights1;
