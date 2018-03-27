
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Amarillo is
Generic(
		MAX_C: natural:=12000000
		);
Port(
	CLK:	in		Std_logic;
	RST:	in		Std_logic;
	AEN:	in		Std_logic;
	ADN:	out	Std_logic;
	AMARILLO :out	Std_logic
	);
end Amarillo;

architecture Behavioral of Amarillo is

signal Tiempo: integer range 0 to MAX_C-1;

begin
	Process(CLK, RST)
		begin
			If (RST='0') then
				AMARILLO<='0';
				Tiempo<=0;
				ADN<='0';
			Elsif (Rising_Edge(CLK)) then
				If (AEN='1') Then
				
					If (Tiempo=MAX_C-1) Then
						Tiempo<=0;
						AMARILLO<='0';
						ADN<='1';
					Else
						Tiempo<=Tiempo+1;
						AMARILLO<='1';
					End if;
				End if;
			End if;
	End Process;

end Behavioral;

