
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity Display is
Port(
	clk,a:			in		std_logic;
	salida:		out	std_logic_vector(7 downto 0)
	);

end Display;

architecture Behavioral of Display is

signal contador: integer range 0 to 9;

begin
 
 process(clk)
	begin
	if(rising_edge(clk)) then
	if A='0' then
		if contador = 9 then
			contador <=0;
		else
			case contador is
			when 0 => salida <= "11000000";
			when 1 => salida <= "11111001";
			when 2 => salida <= "10100100";
			when 3 => salida <= "10110000";
			when 4 => salida <= "10011001";
			when 5 => salida <= "10010010";
			when 6 => salida <= "10000010";
			when 7 => salida <= "11111000";
			when 8 => salida <= "10000000";
			when 9 => salida <= "10010000";
			when others	=> salida <="11111111";
			end case;
			contador <= contador +1;
		end if;
	end if;
	end if;
	end process;
end Behavioral;

