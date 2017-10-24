library verilog;
use verilog.vl_types.all;
entity BCD is
    port(
        clk             : in     vl_logic;
        hex             : inout  vl_logic_vector(15 downto 0);
        dec             : out    vl_logic_vector(15 downto 0);
        IN_wr           : in     vl_logic
    );
end BCD;
