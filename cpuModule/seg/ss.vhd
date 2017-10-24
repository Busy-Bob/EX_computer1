--------------------------------------------------
--  Library Name :  altera_demo
--  Unit    Type :  Text Unit
--
--       |-a-|
--       f   b
--       |-g-|
--       e   c
--       |-d-| h
----------------------------------------------------
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity ss is
port(
r1,r2,r3,r4:in std_logic_vector(3 downto 0);
clk:in std_logic;
seg_data:out std_logic_vector(7 downto 0);
seg_sel:out std_logic_vector(3 downto 0));
end ss;

architecture ss_rtl of ss is

signal count :std_logic_vector(12 downto 0);
signal seg1,seg2,seg3,seg4:std_logic_vector(7 downto 0);
signal seg_s:integer range 0 to 3;

signal clk2:std_logic:='0';

begin
process(clk)
begin 
if clk'event and clk='1' then
if count="111111111111" then
count<=(others=>'0');
clk2<=not clk2;
else
count<=count+1;
end if;
end if;
end process;


process(r1,clk)
begin 
if clk'event and clk='1' then
case r1 is
	   when "0000" =>
        seg1<= "00000011";   --¶ÔÓ¦"abcdefg"
       when "0001"  =>
        seg1<= "10011111"; 
     	when "0010" =>
        seg1<= "00100101"; 
       when "0011"  =>
        seg1<= "00001101"; 
	   when "0100" =>
        seg1<= "10011001"; 
       when "0101"  =>
        seg1<= "01001001"; 
       when "0110"  =>
        seg1<= "01000001"; 
       when "0111"  =>
        seg1<= "00011111"; 
       when "1000"  =>
        seg1<= "00000001"; 
       when "1001"  =>
        seg1<= "00001001";
		when others =>
		seg1<="11111111";
	end case;
	end if;
end process;

process(r2,clk)
begin 
if clk'event and clk='1' then
case r2 is
	    when "0000" =>
        seg2<= "00000011"; 
       when "0001"  =>
        seg2<= "10011111"; 
     	when "0010" =>
        seg2<= "00100101"; 
       when "0011"  =>
        seg2<= "00001101"; 
	   when "0100" =>
        seg2<= "10011001"; 
       when "0101"  =>
        seg2<= "01001001"; 
       when "0110"  =>
        seg2<= "01000001"; 
       when "0111"  =>
        seg2<= "00011111"; 
       when "1000"  =>
        seg2<= "00000001"; 
       when "1001"  =>
        seg2<= "00001001";
		when others =>
		seg2<="11111111";
	end case;
	end if;
end process;

process(r3,clk)
begin 
if clk'event and clk='1' then
case r3 is
	     when "0000" =>
        seg3<= "00000011"; 
       when "0001"  =>
        seg3<= "10011111"; 
     	when "0010" =>
        seg3<= "00100101"; 
       when "0011"  =>
        seg3<= "00001101"; 
	   when "0100" =>
        seg3<= "10011001"; 
       when "0101"  =>
        seg3<= "01001001"; 
       when "0110"  =>
        seg3<= "01000001"; 
       when "0111"  =>
        seg3<= "00011111"; 
       when "1000"  =>
        seg3<= "00000001"; 
       when "1001"  =>
        seg3<= "00001001";
		when others =>
		seg3<="11111111";
	end case;
	end if;
end process;

process(r4,clk)
begin 
if clk'event and clk='1' then
case r4 is
       when "0001"  =>
        seg4<= "10011111"; 
     	when "0010" =>
        seg4<= "00100101"; 
       when "0011"  =>
        seg4<= "00001101"; 
	   when "0100" =>
        seg4<= "10011001"; 
       when "0101"  =>
        seg4<= "01001001"; 
       when "0110"  =>
        seg4<= "01000001"; 
       when "0111"  =>
        seg4<= "00011111"; 
       when "1000"  =>
        seg4<= "00000001"; 
       when "1001"  =>
        seg4<= "00001001";
		when others =>
		seg4<="11111111";
	end case;
	end if;
end process;

process(clk2)
begin 
if clk2'event and clk2='1' then
if seg_s=3 then 
seg_s<=0;
else
seg_s<=seg_s+1;
end if;
case seg_s is
when 0 =>
seg_sel<="0001";
seg_data<=seg1;
when 1 =>
seg_sel<="0010";
	if (seg4="11111111" and seg3="00000011" and seg2="00000011") then
		seg_data<="11111111"; 
	else 
		seg_data<=seg2;
	end if; 
when 2 =>
seg_sel<="0100";
	if (seg4="11111111" and seg3="00000011") then
		seg_data<="11111111"; 
	else 
		seg_data<=seg3;
	end if;
when 3 =>
seg_sel<="1000";
seg_data<=seg4;
when others=>
seg_sel<="0000";
end case;
end if;
end process;

end ss_rtl;	
