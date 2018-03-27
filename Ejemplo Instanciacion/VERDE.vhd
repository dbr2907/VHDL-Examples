
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VERDE is
Generic(
		MAX_C: natural:=12000000
		);
Port(
	CLK:	in		Std_logic;
	RST:	in		Std_logic;
	VEN:	in		Std_logic;
	VDN:	out	Std_logic;
	VERDE:out	Std_logic
	);

end VERDE;

architecture Behavioral of VERDE is

signal Tiempo: integer range 0 to MAX_C-1;


begin
	Process(CLK, RST)
		begin
			If (RST='0') then
				VERDE<='0';
				Tiempo<=0;
				VDN<='0';
			Elsif (Rising_Edge(CLK)) then
				If (VEN='1') Then
				
					If (Tiempo=MAX_C-1) Then
						Tiempo<=0;
						Verde<='0';
						VDN<='1';
					Else
						Tiempo<=Tiempo+1;
						Verde<='1';
					End if;
				End if;
			End if;
	End Process;


end Behavioral;

