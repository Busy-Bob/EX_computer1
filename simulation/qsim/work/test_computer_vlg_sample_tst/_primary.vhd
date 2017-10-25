library verilog;
use verilog.vl_types.all;
entity test_computer_vlg_sample_tst is
    port(
        CLKK            : in     vl_logic;
        reset_pin       : in     vl_logic;
        row             : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end test_computer_vlg_sample_tst;
