----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:34:16 12/05/2017 
-- Design Name: 
-- Module Name:    WB - Behavioral 
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

entity WB is
    Port ( datatomem : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsource : in  STD_LOGIC_VECTOR (1 downto 0);
           pcsource : in  STD_LOGIC_VECTOR (1 downto 0);
           pc4 : in  STD_LOGIC_VECTOR (31 downto 0);
           pc22 : in  STD_LOGIC_VECTOR (21 downto 0);
           pc30 : in  STD_LOGIC_VECTOR (29 downto 0);
           npcresult : out  STD_LOGIC_VECTOR (31 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0));
end WB;

architecture Behavioral of WB is
COMPONENT datamemplex
	PORT(
		datatotem : IN std_logic_vector(31 downto 0);
		aluresult : IN std_logic_vector(31 downto 0);
		pc : IN std_logic_vector(31 downto 0);
		rfsource : IN std_logic_vector(1 downto 0);          
		datatoreg : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	COMPONENT pcmulplex
	PORT(
		pc : IN std_logic_vector(31 downto 0);
		pc4 : IN std_logic_vector(31 downto 0);
		disp30 : IN std_logic_vector(29 downto 0);
		disp22 : IN std_logic_vector(21 downto 0);
		pcsource : IN std_logic_vector(1 downto 0);
		aluresult : IN std_logic_vector(31 downto 0);          
		npcin : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
begin
Inst_datamemplex: datamemplex PORT MAP(
		datatotem => datatomem,
		aluresult => aluresult,
		pc => pc,
		rfsource => rfsource,
		datatoreg => datatoreg
	);
Inst_pcmulplex: pcmulplex PORT MAP(
		pc => pc,
		pc4 => pc4,
		disp30 => pc30,
		disp22 => pc22,
		pcsource => pcsource,
		aluresult => aluresult,
		npcin => npcresult
	);

end Behavioral;

