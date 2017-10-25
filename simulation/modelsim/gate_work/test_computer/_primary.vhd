library verilog;
use verilog.vl_types.all;
entity test_computer is
    port(
        carryout        : out    vl_logic;
        CLKK            : in     vl_logic;
        reset_pin       : in     vl_logic;
        Q               : out    vl_logic_vector(15 downto 0);
        aluc            : out    vl_logic_vector(2 downto 0);
        row             : in     vl_logic_vector(3 downto 0);
        ram_q           : out    vl_logic_vector(7 downto 0);
        data_b          : out    vl_logic_vector(7 downto 0);
        Wren            : out    vl_logic;
        reg_we          : out    vl_logic;
        answer          : out    vl_logic_vector(7 downto 0);
        choice          : out    vl_logic_vector(3 downto 0);
        col             : out    vl_logic_vector(3 downto 0);
        data_a          : out    vl_logic_vector(7 downto 0);
        DI              : out    vl_logic_vector(7 downto 0);
        pc              : out    vl_logic_vector(7 downto 0);
        seg             : out    vl_logic_vector(7 downto 0);
        state           : out    vl_logic_vector(2 downto 0)
    );
end test_computer;
