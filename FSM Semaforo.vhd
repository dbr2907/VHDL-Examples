
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


entity Semaforo is
Port(
	CLK: in Std_logic;
	RST: in Std_Logic;
	LED:	out Std_logic_vector(2 downto 0)
	);
end Semaforo;

architecture Behavioral of Semaforo is

signal contador: integer range 0 to 11999999;

type Semaforo is (Verde, Amarillo, Rojo);
signal Estado: SEMAFORO;

begin
	process(CLK, RST)
		begin
			IF RST='0' then
				Estado<=Verde;
				Led<="111";
			Elsif Rising_edge(CLK) then
				Case Estado is
					When Verde =>
						if Contador=11999999 then
							Contador<=0;
							Estado<=Amarillo;
						else
							Contador<=contador+1;
							LED<="001";
						end if;
					When Amarillo =>
						if Contador=11999999 then
							Contador<=0;
							Estado<=Rojo;
						else
							Contador<=contador+1;
							LED<="010";
						end if;
					When Rojo =>
						if Contador=11999999 then
							Contador<=0;
							Estado<=Verde;
						else
							Contador<=contador+1;
							LED<="100";
						end if;
					When OTHERS =>
						Estado<= Verde;
						LED<="000";
				End Case;
			
			End if;
			
		end process;

end Behavioral;

