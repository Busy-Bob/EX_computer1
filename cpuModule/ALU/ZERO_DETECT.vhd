library ieee;
use ieee.std_logic_1164.all;
entity zero_detect is
	port(
		data:in std_logic_vector(7 downto 0);
		zero:out std_logic
	);
end zero_detect;


architecture behave of zero_detect is
begin
	zero<=	'1' when data="00000000" else
			'0';
end behave;

