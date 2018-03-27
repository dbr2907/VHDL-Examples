
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

entity Mutiplexor is
Port(
	Display: out Std_Logic_Vector(7 downto 0);
	Enable: out Std_logic_vector(2 downto 0);
	CLK: in Std_Logic
);
end Mutiplexor;

architecture Behavioral of Mutiplexor is

signal Numero: integer range 0 to 9;
signal Unidad: integer range 0 to 9;
signal Decena: integer range 0 to 9;
signal Multiplexacion: integer range 0 to 119999;
signal Segundo: integer range 0 to 11999999;
signal Bandera: Std_Logic;

begin

process(Clk)
	begin
		if(rising_edge(CLK)) then
		
			If(Segundo=11999999) then
				Segundo<=0;				
			if(Unidad=9) then
				Unidad<=0;
				If(Decena=9) then
					Decena<=0;
				Else
					Decena<=Decena+1;
				End if;
			else
				Unidad<=Unidad+1;
			end if;
			else
				Segundo<=Segundo+1;
			end if;
		
		
		
		
		
		
		
--------------------Multiplexacion en el Tiempo------
			if(Multiplexacion=119999) then
				Multiplexacion<=0;
				Bandera<=Not(Bandera);
				If(Bandera='0') then
					Numero<=Unidad;
					Enable<="110";
				Else
					Numero<=Decena;
					Enable<="101";
				end if;
			else
				Multiplexacion<=Multiplexacion+1;
			end if;
-----------------------------------------------------

------------------Muestra Numero en Display----------
			Case Numero is
				When 0 => Display<="11000000";--0
				When 1 => Display<="11111001";--1
				When 2 => Display<="10100100";--2
				When 3 => Display<="10110000";--3
				When 4 => Display<="10011001";--4
				When 5 => Display<="10010010";--5
				When 6 => Display<="10000010";--6
				When 7 => Display<="11111000";--7
				When 8 => Display<="10000000";--8
				When 9 => Display<="10011000";--9
				When Others => Display<="11111111";
			end case;
		end if;
end process;


end Behavioral;

