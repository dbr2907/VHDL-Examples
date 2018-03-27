
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Rojo is
Generic(
		MAX_C: natural:=12000000
		);
Port(
	CLK:	in		Std_logic;
	RST:	in		Std_logic;
	REN:	in		Std_logic;
	RDN:	out	Std_logic;
	ROJO :out	Std_logic
	);
end Rojo;

architecture Behavioral of Rojo is

signal Tiempo: integer range 0 to MAX_C-1;

begin
	Process(CLK, RST)
		begin
			If (RST='0') then
				ROJO<='0';
				Tiempo<=0;
				RDN<='0';
			Elsif (Rising_Edge(CLK)) then
				If (REN='1') Then
				
					If (Tiempo=MAX_C-1) Then
						Tiempo<=0;
						ROJO<='0';
						RDN<='1';
					Else
						Tiempo<=Tiempo+1;
						ROJO<='1';
					End if;
				End if;
			End if;
	End Process;

end Behavioral;

