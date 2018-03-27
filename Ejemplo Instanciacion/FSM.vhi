
-- VHDL Instantiation Created from source file FSM.vhd -- 16:04:46 12/15/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_FSM: FSM PORT MAP(
		CLK => ,
		RST => ,
		V_EN => ,
		A_EN => ,
		R_EN => ,
		V_DN => ,
		A_DN => ,
		R_DN => 
	);


