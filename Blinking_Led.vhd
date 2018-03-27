
----------------------------------------------------------------------------------
--This work is licensed under a
--Creative Commons Attribution-NonCommmercial-ShareAlike 4.0 International
--This license lets others remix, tweak, and build upon this work non-commercially,
--as long as they credit the AUTHOR and license their new creations under the identical terms.

--Author: David Barrientos (2015)
--Simple VHDL Examples
--d[dot]b[dot]gt[at]ieee[dot]org
--Universidad de San Carlos de Guatemala
--EE School
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BLed is
Port(
	Led: out Std_Logic;
	Clk: in Std_Logic
);
end BLed;


architecture Behavioral of BLed is

signal cont: integer range 0 to 11999999;
signal Flag: std_logic;
 
begin

process(clk)
	begin
		if(rising_edge(clk)) then
			cont<=cont+1;
			if(cont=11999999) then
				cont<=0;
				if(Flag='1') then
					Flag<='0';
				else
					Flag<='1';
				end if;
			end if;
		end if;
	
end process;

LED<=Flag;

end Behavioral;

