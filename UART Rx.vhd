
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity UartRx is
Generic(
	Uart_Bits: Natural:=8;
	BaudRate: Integer :=104
	--Baudrate = (Clock/Baudrate) Example (125MHz/115200)=1085
);

Port(
	CLK:		in		Std_Logic;
	RST:		in		Std_Logic;
	RX:		in		Std_Logic;
	LED:		out	Std_Logic_Vector(7 downto 0)
);

end UartRx;

architecture Behavioral of UartRx is

Signal Data: 	Std_Logic_Vector(Uart_Bits-1 downto 0);	
Signal Count:	Integer Range 0 to Uart_Bits;
Signal PRSCL:	Integer Range 0 to BaudRate*2;

Type FSM is (Idle, FirstBit, Data_Fetch, Resync);
Signal State : FSM;

Begin
	Process(CLK, RST)
	Begin
		If(RST = '0') Then
			State<= Idle;
			Count<=0;
			PRSCL<=0;
			Data <= (Others => '0');
		Elsif(Rising_Edge(CLK)) Then
			Case State is
				When IDLE =>
					Count<=0;
					PRSCL<=0;
					If(RX='0') Then
						State<=FirstBit;
					End If;
					
				When FirstBit =>
						If(PRSCL=BaudRate+(Baudrate/2)) Then
							PRSCL<=0;
							Data(Count)<=RX;
							Count<=Count+1;
							State<=Data_Fetch;
						Else
							PRSCL<=PRSCL+1;
						End If;
											
				When Data_Fetch =>
						IF(PRSCL=BaudRate) Then
							PRSCL<=0;
							IF(Count<Uart_Bits) Then
								Data(Count)<=RX;
								Count<=Count+1;
							Else
								State<=Resync;
							End If;
						Else
							PRSCL<=PRSCL+1;
						End If;
						
				When Resync =>
						If(RX='1') Then
							PRSCL<=0;
							State<=IDLE;
						End If;
						
				When Others =>
					PRSCL<=0;
					State<= Idle;
					Count<=0;
					Data <= (Others => '0');
			End Case;
		End If;
	End Process;
	
LED<=Data;

end Behavioral;

