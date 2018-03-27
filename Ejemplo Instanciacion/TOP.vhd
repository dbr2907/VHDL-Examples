
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity TOP is
Port(
	Clock:	in		std_logic;
	Reset:	in		std_logic;
	V:		out	std_logic;
	A:		out	std_logic;
	R:		out	std_logic
	);

end TOP;

architecture Behavioral of TOP is

signal VREN:	Std_logic;
signal AMEN:	Std_logic;
Signal ROEN:	Std_logic;
signal VRDN:	Std_logic;
signal AMDN:	Std_logic;
Signal RODN:	Std_logic;



	COMPONENT FSM
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		V_DN : IN std_logic;
		A_DN : IN std_logic;
		R_DN : IN std_logic;          
		V_EN : OUT std_logic;
		A_EN : OUT std_logic;
		R_EN : OUT std_logic
		);
	END COMPONENT;

	COMPONENT Amarillo
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		AEN : IN std_logic;          
		ADN : OUT std_logic;
		AMARILLO : OUT std_logic
		);
	END COMPONENT;


	COMPONENT Rojo
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		REN : IN std_logic;          
		RDN : OUT std_logic;
		ROJO : OUT std_logic
		);
	END COMPONENT;

	COMPONENT VERDE
	PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		VEN : IN std_logic;          
		VDN : OUT std_logic;
		VERDE : OUT std_logic
		);
	END COMPONENT;


begin

	Inst_FSM: FSM PORT MAP(
		CLK => Clock,
		RST => Reset,
		V_EN => VREN,
		A_EN => AMEN,
		R_EN => ROEN,
		V_DN => VRDN,
		A_DN => AMDN,
		R_DN => RODN
	);
	
		Inst_Amarillo: Amarillo PORT MAP(
		CLK => Clock,
		RST => Reset,
		AEN => AMEN,
		ADN => AMDN,
		AMARILLO => A 
	);
	
	
	Inst_Rojo: Rojo PORT MAP(
		CLK => Clock,
		RST => Reset,
		REN => ROEN,
		RDN => RODN,
		ROJO => R
	);
	
	Inst_VERDE: VERDE PORT MAP(
		CLK => Clock,
		RST => Reset,
		VEN => VREN,
		VDN => VRDN,
		VERDE => V
	);


end Behavioral;

