library verilog;
use verilog.vl_types.all;
entity test_computer_vlg_sample_tst is
    port(
        carryin         : in     vl_logic;
        CLK             : in     vl_logic;
        reset_pin       : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end test_computer_vlg_sample_tst;
