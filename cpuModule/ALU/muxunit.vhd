-------------------mux------------------------

---------------library declaration---------------
library ieee;
use ieee.std_logic_1164.all;
-------------------------------------------------

---------------entity----------------------------
entity muxunit is
	port(
		 data_and: in std_logic_vector(7 downto 0);
		 data_pmC: in std_logic_vector(7 downto 0);
		 data_plusminus: in std_logic_vector(7 downto 0);
		 data_or: in std_logic_vector(7 downto 0);
		 data_cmp: in std_logic_vector(7 downto 0);
		 sel: in std_logic_vector(2 downto 0);
		 result: out std_logic_vector(7 downto 0));
end entity;
-------------------------------------------------

---------------architecture----------------------
architecture muxunit_a OF muxunit is
begin
	process (sel,data_and,data_pmC,data_plusminus,data_cmp)--
	begin
		case sel is
			when "000" => result <= data_and;
			when "001"|"101" => result <= data_plusminus;
			when "010"|"100" => result <= data_pmC;
			when "110" => result <= data_or;
			when others => result <= data_cmp;
		end case;
	end process;
end architecture;