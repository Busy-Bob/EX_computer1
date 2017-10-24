library verilog;
use verilog.vl_types.all;
entity BCD_vlg_sample_tst is
    port(
        IN_wr           : in     vl_logic;
        clk             : in     vl_logic;
        hex             : in     vl_logic_vector(15 downto 0);
        sampler_tx      : out    vl_logic
    );
end BCD_vlg_sample_tst;
