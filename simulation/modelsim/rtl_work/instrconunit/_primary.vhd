library verilog;
use verilog.vl_types.all;
entity instrconunit is
    port(
        BRANCH          : in     vl_logic;
        JUMP            : in     vl_logic;
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        imm             : in     vl_logic_vector(7 downto 0);
        PC              : out    vl_logic_vector(7 downto 0)
    );
end instrconunit;
