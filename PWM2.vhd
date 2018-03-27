
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Pwm is

Generic(
	Tt: Integer := 240000
--	Ta: Integer := 30000
);

Port(
		CLK:		in		Std_Logic;
		DPS:		in		Std_Logic_Vector(3 downto 0);
		PWM:		out	Std_Logic
);

end Pwm;

architecture Behavioral of Pwm is

signal Cnt: integer range 0 to Tt;
signal Ta: integer range 0 to Tt;
begin



process(CLK)
	begin
			if(rising_edge(CLK)) then
				Case DPS is
					When "0000" =>
						Ta<=6000;
					When "0001" =>
						Ta<=12000;
					When "0010" =>
						Ta<=18000;
					When "0100" =>
						Ta<=24000;
					When "1000" =>
						Ta<=30000;
					When others =>
						Ta<=6000;				
				End Case;
				
				
				if(Cnt=Tt-1) then
					Cnt<=0;
				else
					Cnt<=Cnt+1;
				end if;
				
				if(Cnt<Ta) then
					PWM<='1';
				else
					PWM<='0';
				end if;
				
			end if;
end process;

end Behavioral;

