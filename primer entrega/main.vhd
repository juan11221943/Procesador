
library IEEE;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;


entity main is
Port ( clkm : in  STD_LOGIC;
		dataoutm : OUT std_logic_vector(31 downto 0);
      rstm : in  STD_LOGIC);
end main;

architecture Behavioral of main is

	COMPONENT npc
	PORT(
		rst : IN std_logic;
		datain : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

		COMPONENT reg32
	PORT(
		clk : IN std_logic;
		datain1 : IN std_logic_vector(31 downto 0);
		rst1 : IN std_logic;          
		dataout1 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	
		COMPONENT sum
	PORT(
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);          
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT rom
	PORT(
		RST : IN std_logic;
		ADDR : IN std_logic_vector(5 downto 0);          
		DATA : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	


signal do1: std_logic_vector(31 downto 0);
signal do4: std_logic_vector(31 downto 0);
signal do2: std_logic_vector(31 downto 0);
constant op1: std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
signal resul: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin

	Inst_sum: sum PORT MAP(
		oper1 => op1,
		oper2 => do1,
		result => resul
	);	

	
	Inst_npc: npc PORT MAP(
		rst => rstm,
		datain => resul,
		dataout => do2,
		clk => clkm
	);
	Inst_reg32: reg32 PORT MAP(
		clk => clkm,
		datain1 => do2,
		rst1 => rstm,
		dataout1 => do1
	);
	Inst_rom: rom PORT MAP(
		RST => rstm,
		ADDR => do1(5 downto 0),
		DATA => do4
	);
	


dataoutm <= do4;

end Behavioral;

