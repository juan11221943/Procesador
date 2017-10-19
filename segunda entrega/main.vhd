
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
	
	COMPONENT omux
	PORT(
		i13 : IN std_logic;
		imm32 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);          
		oper2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT seu
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT cu
	PORT(
		op2 : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		aluop : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	COMPONENT alu
	PORT(
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);
		c: IN std_logic;		
		result : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT RF
	PORT(
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		dwr : IN std_logic_vector(31 downto 0);
		rst : IN std_logic;          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT psrmod
	PORT(
		csr1 : IN std_logic_vector(31 downto 0);
		omux : IN std_logic_vector(31 downto 0);
		result : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	COMPONENT psr
	PORT(
		nzvc : IN std_logic_vector(3 downto 0);
		ncwp : IN std_logic;          
		cwp : OUT std_logic;
		c : OUT std_logic
		);
	END COMPONENT;
	COMPONENT WM
	PORT(
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		cwp : IN std_logic;
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);          
		ncwp : OUT std_logic;
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;

signal do1: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do4: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do5: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do6: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do7: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do8: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do9: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do2: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal rs1aux: std_logic_vector(5 downto 0);
signal rs2aux: std_logic_vector(5 downto 0);
signal rdaux: std_logic_vector(5 downto 0);
signal do10: std_logic;
signal cwpaux: std_logic;
signal ncwpaux: std_logic;
signal nzvc: std_logic_vector(3 downto 0);
signal aluopaux: std_logic_vector(5 downto 0);
constant op1: std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
signal resul: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";

begin
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
	Inst_sum: sum PORT MAP(
		oper1 => op1,
		oper2 => do1,
		result => resul
	);	
	Inst_rom: rom PORT MAP(
		RST => rstm,
		ADDR => do1(5 downto 0),
		DATA => do4
	);
	
	Inst_seu: seu PORT MAP(
		imm13 => do4(12 downto 0),
		dataout => do8
	);
	
	Inst_omux: omux PORT MAP(
		i13 => do4(13),
		imm32 => do8,
		crs2 => do7,
		oper2 => do9
	);
	Inst_alu: alu PORT MAP(
		oper1 => do6,
		oper2 => do9,
		aluop => aluopaux,
		c => do10,
		result => do5
	);
	Inst_psrmod: psrmod PORT MAP(
		csr1 => do6,
		omux => do9,
		result => do5,
		aluop => aluopaux,
		nzvc => nzvc
	);
	Inst_psr: psr PORT MAP(
		nzvc => nzvc,
		ncwp => ncwpaux,
		cwp => cwpaux,
		c => do10
	);
	Inst_cu: cu PORT MAP(
		op2 => do4(31 downto 30),
		op3 => do4(24 downto 19),
		aluop => aluopaux
	);
	Inst_RF: RF PORT MAP(
		rs1 => rs1aux,
		rs2 => rs2aux,
		rd => rdaux,
		dwr => do5,
		rst => rstm,
		crs1 => do6,
		crs2 => do7
	);
	Inst_WM: WM PORT MAP(
		rs1 => do4(18 downto 14),
		rs2 => do4(4 downto 0),
		rd => do4(29 downto 25),
		cwp => cwpaux,
		op => do4(31 downto 30),
		op3 => do4(24 downto 19),
		ncwp => ncwpaux,
		nrs1 => rs1aux,
		nrs2 => rs2aux,
		nrd => rdaux
	);
dataoutm <= do5;
end Behavioral;

