library verilog;
use verilog.vl_types.all;
entity test_computer is
    port(
        carryout        : out    vl_logic;
        carryin         : in     vl_logic;
        aluc            : out    vl_logic_vector(2 downto 0);
        Q               : out    vl_logic_vector(15 downto 0);
        CLK             : in     vl_logic;
        reset_pin       : in     vl_logic;
        ram_q           : out    vl_logic_vector(7 downto 0);
        data_b          : out    vl_logic_vector(7 downto 0);
        Wren            : out    vl_logic;
        reg_we          : out    vl_logic;
        answer          : out    vl_logic_vector(7 downto 0);
        data_a          : out    vl_logic_vector(7 downto 0);
        DI              : out    vl_logic_vector(7 downto 0);
        pc              : out    vl_logic_vector(7 downto 0)
    );
end test_computer;
