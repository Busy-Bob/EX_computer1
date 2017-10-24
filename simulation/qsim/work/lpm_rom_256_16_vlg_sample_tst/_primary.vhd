library verilog;
use verilog.vl_types.all;
entity lpm_rom_256_16_vlg_sample_tst is
    port(
        address         : in     vl_logic_vector(7 downto 0);
        clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end lpm_rom_256_16_vlg_sample_tst;
