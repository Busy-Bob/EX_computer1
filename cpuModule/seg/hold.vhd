library ieee;
use ieee.std_logic_1164.all;
entity hold is
	port(
	    clk:in std_logic;
		datain:in std_logic_vector(15 downto 0);
		dataout:out std_logic_vector(15 downto 0)
	);
end hold;

architecture behave of hold is
signal data:std_logic_vector(15 downto 0);
begin
process(clk)
begin
if clk'event and clk='1' then
	if datain="ZZZZZZZZZZZZZZZZ" or datain="XXXXXXXXXXXXXXXX" then
	data<=data;
	else data<=datain;
	end if;
end if;
end process;
dataout<=data;
end behave;
