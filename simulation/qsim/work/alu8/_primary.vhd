library verilog;
use verilog.vl_types.all;
entity alu8 is
    port(
        ZERO            : out    vl_logic;
        DATA_A          : in     vl_logic_vector(7 downto 0);
        DATA_B          : in     vl_logic_vector(7 downto 0);
        ALUOP           : in     vl_logic_vector(2 downto 0);
        carry_in        : in     vl_logic;
        carry_out       : out    vl_logic;
        RESULT          : out    vl_logic_vector(7 downto 0)
    );
end alu8;
