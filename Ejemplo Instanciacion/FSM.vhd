
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity FSM is
Port(
	CLK:	in		std_logic;
	RST:	in		std_logic;
	V_EN:	out	std_logic;
	A_EN:	out	std_logic;
	R_EN: out	std_logic;
	V_DN:	in		std_logic;
	A_DN: in		std_logic;
	R_DN:	in		std_logic
	);

end FSM;



architecture Behavioral of FSM is

	Type FSM is (Verde, Amarillo, Rojo);
	Signal Estado : FSM;

begin
	process(CLK, RST)
	begin
		If(RST = '0') Then
			Estado <= Verde;
			V_EN <= '1';
			A_EN <= '0';
			R_EN <= '0';
			
		Elsif(rising_edge(CLK)) Then
			Case Estado is
				When Verde =>
					If (V_DN = '1') Then
						V_EN <= '0';
						Estado <= Amarillo;
					Else
						V_EN <= '1';
					End if;
				
				When Amarillo =>
					If (A_DN = '1') Then
						A_EN <= '0';
						Estado <= Rojo;
					Else
						A_EN <= '1';
					End if;
					
				When Rojo =>
					If (R_DN = '1') Then
						R_EN <= '0';
						Estado <= Verde;
					Else
						R_EN <= '1';
					End if;
					
				When Others =>
					Estado <= Verde;
					V_EN <= '1';
					A_EN <= '0';
					R_EN <= '0';

			End case;
		End if;
	
	End process;

End Behavioral;

