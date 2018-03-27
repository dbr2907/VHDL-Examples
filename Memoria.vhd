
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MEM is
Port(
	Clk: in 	Std_logic;
--	DPS: in	Std_logic_vector(7 downto 0);
	RST: in	Std_logic;
	EN:  out	Std_logic_vector(2 downto 0);
	Display: out	Std_logic_vector(7 downto 0)

);
end MEM;

architecture Behavioral of MEM is

Signal i: integer range 0 to 3;

type Byte is array (7 downto 0) of Std_logic;
type Memoria is array (0 to 15) of Byte;
Signal Datos: Memoria;

begin

EN<="110";

	process(clk,RST)
		begin
		
		If RST='0' then
			for i in 0 to 3 loop
				MEM(i) <= "00000000";
			end loop;

		Elsif(rising_edge(CLK)) then
			MEM(3) <= "00000001";
			for i in 0 to 2 loop
				MEM(i) <= MEM(i+1);
			end loop;
			Display<=std_logic_vector(MEM(0));
		End if;
	End process;

end Behavioral;

