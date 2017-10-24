-----------------------SSD_abs---------------------------

---------------library declaration---------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;
--use work.my_data_types.all;
-------------------------------------------------

----------------entity---------------------------
entity SSD_abs is
	port(
		 display_in: in std_logic_vector (15 downto 0);
		 display_out: out std_logic_vector (15 downto 0);
		 res_sign:out std_logic;
		 zero:out std_logic
		 
		 );
end entity;
-------------------------------------------------

----------------architecture---------------------
architecture SSD_abs_a of SSD_abs is
begin
	process(display_in)
	begin
		if display_in<0 then
			display_out <= conv_std_logic_vector(-conv_integer(display_in),16);
			res_sign <= '1';
		else
			display_out <= display_in;
			res_sign <= '0';
		end if;
		
		if display_in=0 then
			zero <= '1';
		else
			zero <= '0';
		end if;
		
	end process;
end architecture;
