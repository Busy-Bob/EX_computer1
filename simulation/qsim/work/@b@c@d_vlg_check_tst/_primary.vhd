library verilog;
use verilog.vl_types.all;
entity BCD_vlg_check_tst is
    port(
        dec             : in     vl_logic_vector(15 downto 0);
        hex             : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end BCD_vlg_check_tst;
