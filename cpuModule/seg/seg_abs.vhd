-----------------------SSD_abs---------------------------

---------------library declaration---------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
-------------------------------------------------

----------------entity---------------------------
entity seg_abs is
	port(
		 display_in: in std_logic_vector (15 downto 0);
		 display_out: out std_logic_vector (15 downto 0) );
end entity;
-------------------------------------------------

----------------architecture---------------------
architecture seg_abs_a of seg_abs is
begin
	process(display_in)
	begin
		if display_in<0 then
			display_out <= conv_std_logic_vector(-conv_integer(display_in),16);
		else
			display_out <= display_in;
		end if;
		
	end process;
end architecture;
