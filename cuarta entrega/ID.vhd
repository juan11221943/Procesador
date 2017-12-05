----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:32:16 12/05/2017 
-- Design Name: 
-- Module Name:    ID - Behavioral 
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

entity ID is
    Port ( nrd : in  STD_LOGIC_VECTOR (5 downto 0);
				rst : in STD_LOGIC;
           datatoreg : in  STD_LOGIC_VECTOR(31 downto 0);
			  aluop : out STD_LOGIC_VECTOR(5 downto 0);
           nrs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  op2: in STD_LOGIC_VECTOR(2 downto 0);
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           cond : in  STD_LOGIC_VECTOR (3 downto 0);
           imm13 : in  STD_LOGIC_VECTOR(12 downto 0);
			  imm13out: out STD_LOGIC_VECTOR(31 downto 0);
           rfdest : out  STD_LOGIC;
           rfsource : out  STD_LOGIC_VECTOR (1 downto 0);
           crs1 : out  STD_LOGIC_VECTOR (31 downto 0);
			  crs2 : out  STD_LOGIC_VECTOR (31 downto 0);
           crd : out  STD_LOGIC_VECTOR (31 downto 0);
           cwp : out  STD_LOGIC;
           wrenem : out  STD_LOGIC;
           rdenmem : out  STD_LOGIC;
           pcsource : out  STD_LOGIC_VECTOR (1 downto 0);
           ncwp : in  STD_LOGIC);
end ID;

architecture Behavioral of ID is
signal weaux : std_logic;
COMPONENT cu
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0); 
		cond : IN std_logic_vector(3 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		op2 : IN std_logic_vector(2 downto 0);          
		rden : OUT std_logic;
		wren : OUT std_logic;
		rfdest : OUT std_logic;
		rfsource : OUT std_logic_vector(1 downto 0);
		pcsource : OUT std_logic_vector(1 downto 0);
		we : OUT std_logic;
		aluop : OUT std_logic_vector(5 downto 0)
		);
		END COMPONENT;
		COMPONENT RF
	PORT(
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		dwr : IN std_logic_vector(31 downto 0); 
		rst : IN std_logic;
		we : IN std_logic;
		crs1 : OUT std_logic_vector(31 downto 0);
		crd : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0)
		);
		END COMPONENT;
		COMPONENT seu
	PORT(
		imm13 : IN std_logic_vector(12 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;
begin
Inst_cu: cu PORT MAP(
		op => op,
		op3 => op3,
		cond => cond,
		icc => icc,
		op2 => op2,
		rden => rdenmem ,
		wren => wrenem,
		rfdest => rfdest,
		rfsource => rfsource,
		pcsource => pcsource,
		we => weaux,
		aluop => aluop
	);
	Inst_RF: RF PORT MAP(
		rs1 => nrs1,
		rs2 => nrs2,
		rd => nrd,
		dwr => datatoreg,
		rst => rst,
		we => weaux,
		crs1 => crs1,
		crd => crd,
		crs2 => crs2
	);
Inst_seu: seu PORT MAP(
		imm13 => imm13,
		dataout => imm13out
	);
end Behavioral;

