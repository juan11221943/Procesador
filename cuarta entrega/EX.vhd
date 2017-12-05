----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:08:59 12/05/2017 
-- Design Name: 
-- Module Name:    EX - Behavioral 
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

entity EX is
    Port ( i13 : in  STD_LOGIC;
           imm13 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  op :in STD_LOGIC_VECTOR(1 downto 0);
           cwp : out  STD_LOGIC;
           ncwp : in  STD_LOGIC;
			  icc : out STD_LOGIC_VECTOR (3 downto 0);
           aluresult : out  STD_LOGIC_VECTOR (31 downto 0));
end EX;

architecture Behavioral of EX is
COMPONENT alu
	PORT(
		op : IN std_logic_vector(1 downto 0);
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);
		aluop : IN std_logic_vector(5 downto 0);
		c: IN std_logic;		
		result : OUT std_logic_vector(31 downto 0)
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
		icc : OUT std_logic_vector(3 downto 0);
		c : OUT std_logic
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
signal do9: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal do11: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";
signal nzvc: std_logic_vector(3 downto 0);
signal do10: std_logic;
signal cwpaux: std_logic;
begin
Inst_alu: alu PORT MAP(
		op => op,
		oper1 => crs1,
		oper2 => do9,
		aluop => aluop,
		c => do10,
		result => do11
	);
Inst_psrmod: psrmod PORT MAP(
		csr1 => crs1,
		omux => do9,
		result => do11,
		aluop => aluop,
		nzvc => nzvc
	);
	Inst_psr: psr PORT MAP(
		nzvc => nzvc,
		ncwp => ncwp,
		cwp => cwp,
		icc => icc,
		c => do10
	);
Inst_omux: omux PORT MAP(
		i13 => i13,
		imm32 => imm13,
		crs2 => crs2,
		oper2 => do9
	);
	aluresult <= do11;
end Behavioral;

