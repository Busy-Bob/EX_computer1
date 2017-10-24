library verilog;
use verilog.vl_types.all;
entity alu8_vlg_check_tst is
    port(
        carry_out       : in     vl_logic;
        RESULT          : in     vl_logic_vector(7 downto 0);
        ZERO            : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end alu8_vlg_check_tst;
