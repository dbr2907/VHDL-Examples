
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity SPI_ADC is
	 Generic(	R_Bits : natural := 8 );  -- Bits Resoulcion
    Port ( 
			  RST   : in   STD_LOGIC;  --Boton Reset
           CLK_I : in   STD_LOGIC;	--Entrada Reloj (No mas de 2.0 MHz)
           EN	  : in   STD_LOGIC;	--Enable del Modulo
           DN	  : out  STD_LOGIC;	--Done del Modulo
			  LEDS  : out	STD_LOGIC_VECTOR(R_Bits-1 DOWNTO 0); --Salida
			-- SPI Ports
           SCLK  : out  STD_LOGIC;	--Clock SPI
           CS	  : out  STD_LOGIC;	--Chip Select
           MISO  : in   STD_LOGIC); --Entrada de Datos
end SPI_ADC;



architecture Behavioral of SPI_ADC is
	type FSM is (CONV, SPI, RESYNC);
	signal state 		: FSM;
	signal EN_SCLK    : std_logic;  --Enable Reloj SPI
	signal Data       : std_logic_vector (R_Bits-1 downto 0); --Datos
	signal C_Time     : integer range 0 to 40;  --Contador de 20 microsegundos
	signal count    	: integer range 0 to R_Bits; --Contador Posicion del Vector
	
begin
	process (CLK_I,RST)
	begin
		If (RST = '1') Then
			state <= CONV; 		-- Valor inicial de la maquina de estado
			CS <= '1';               	-- Mantener en alto "Chip Select"
			EN_SCLK <= '0';           	-- Deshabilitar SCLK
			count <= 0;           -- Iniciar contador de shift-register SPI
			C_Time <=0;
			DN <= '0';
			Data <= (others => '0');
		Elsif(rising_edge(CLK_I)) Then
			If (EN='1') Then
				Case state is
				
					When CONV =>
						CS <= '0';
						count<= 0;
						DN  <= '0';
						If (C_Time=40) Then
							C_Time<=0;
							state<=SPI;
						Else
							C_Time<=C_Time+1;
						End If;
						
					When SPI =>
						If count <= R_Bits-1 Then
							EN_SCLK <= '1';
							Data(R_Bits-1-count)<=MISO;
							count <= count + 1;
						Else
							state <= RESYNC;
							EN_SCLK <= '0';
						End If;
					
					When RESYNC =>
						DN<='1';
						state<=CONV;
						
					When Others =>
						state <= CONV; 
						CS <= '1';               	
						EN_SCLK <= '0';          
						count <= 0;           
						C_Time <=0;
						DN <= '0';
						Data <= (others => '0');
				End case;
			End If;
		End If;
	End Process;
	
	SCLK  <= CLK_I and EN_SCLK;
	LEDS <= Data;
	
	
end Behavioral;