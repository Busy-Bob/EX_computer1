library ieee;
use ieee.std_logic_1164.all;
entity zero_convert is
	port(
		data:out std_logic_vector(7 downto 0);
		zero:in std_logic
	);
end zero_convert;

architecture behave of zero_convert is
begin
	data<= "0000000"&zero;

end behave;
