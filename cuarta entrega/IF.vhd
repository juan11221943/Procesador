----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:09:16 12/05/2017 
-- Design Name: 
-- Module Name:    IF - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity IFP is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           genrd : out  STD_LOGIC_VECTOR (5 downto 0);
			  cwpaux : in STD_LOGIC;
			  ncwpaux: out STD_LOGIC;
			  rfdest: in STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR(3 downto 0);
			  cond: out STD_LOGIC_VECTOR(3 downto 0);
			  op: out STD_LOGIC_VECTOR(1 downto 0);
			  op3: out STD_LOGIC_VECTOR(5 downto 0);
			  op2: out STD_LOGIC_VECTOR(2 downto 0);
			  imm13c: out STD_LOGIC_VECTOR(12 downto 0);
				pc : out STD_LOGIC_VECTOR(31 downto 0);
				pc22: out STD_LOGIC_VECTOR(21 downto 0);
				pc30:out STD_LOGIC_VECTOR(29 downto 0);
				pc4 : out STD_LOGIC_VECTOR(31 downto 0);
				npcresult: in STD_LOGIC_VECTOR(31 downto 0);
           imm13 : out  STD_LOGIC);
end IFP;

architecture Behavioral of IFP is
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
		nrd : OUT std_logic_vector(5 downto 0);
		r15 : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	COMPONENT rfmulplex
	PORT(
		rfdest : IN std_logic;
		RD : IN std_logic_vector(5 downto 0);
		r15 : IN std_logic_vector(5 downto 0);          
		nrd : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	signal do1: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do4: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do5: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do6: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do7: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do2: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal rs1aux: std_logic_vector(5 downto 0);
signal rs2aux: std_logic_vector(5 downto 0);
signal rdaux: std_logic_vector(5 downto 0);
signal resul: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
constant op1: std_logic_vector(31 downto 0) := "00000000000000000000000000000001";
signal r15aux : std_logic_vector(5 downto 0);

begin
Inst_npc: npc PORT MAP(
		rst => rst,
		datain => npcresult,
		dataout => do2,
		clk => clk
	);
	Inst_reg32: reg32 PORT MAP(
		clk => clk,
		datain1 => do2,
		rst1 => rst,
		dataout1 => do1
	);
	Inst_sum: sum PORT MAP(
		oper1 => op1,
		oper2 => do2,
		result => resul
	);	
	Inst_rom: rom PORT MAP(
		RST => rst,
		ADDR => do1(5 downto 0),
		DATA => do4
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
		nrd => rdaux,
		r15 => r15aux
	);
	Inst_rfmulplex: rfmulplex PORT MAP(
		rfdest => rfdest,
		RD => rdaux,
		r15 => r15aux,
		nrd => genrd
	);
	imm13c <= do4(12 downto 0);
	imm13 <= do4(13);
	op <= do4(31 downto 30);
	op3 <= do4(24 downto 19);
	op2 <= do4(24 downto 22);
	pc <= do1;
	pc4 <= resul;
	pc22 <= do4(21 downto 0);
	pc30 <= do4(29 downto 0);
end Behavioral;

