library verilog;
use verilog.vl_types.all;
entity alu8_vlg_sample_tst is
    port(
        ALUOP           : in     vl_logic_vector(2 downto 0);
        carry_in        : in     vl_logic;
        DATA_A          : in     vl_logic_vector(7 downto 0);
        DATA_B          : in     vl_logic_vector(7 downto 0);
        sampler_tx      : out    vl_logic
    );
end alu8_vlg_sample_tst;
