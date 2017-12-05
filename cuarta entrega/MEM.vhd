----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:26:28 12/05/2017 
-- Design Name: 
-- Module Name:    MEM - Behavioral 
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

entity MEM is
    Port ( aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
				crs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           crd : in  STD_LOGIC_VECTOR (31 downto 0);
           wrenmem : in  STD_LOGIC;
           rdenmem : in  STD_LOGIC;
           datatomem : out  STD_LOGIC_VECTOR (31 downto 0));
end MEM;

architecture Behavioral of MEM is
COMPONENT datamemory
	PORT(
		rden : IN std_logic;
		wren : IN std_logic;
		crd : IN std_logic_vector(31 downto 0);
		crs1 : IN std_logic_vector(31 downto 0);
		aluresult : IN std_logic_vector(31 downto 0);          
		dataout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

begin
Inst_datamemory: datamemory PORT MAP(
		rden => rdenmem,
		wren => wrenmem,
		crd => crd,
		crs1 => crs1,
		aluresult => aluresult,
		dataout => datatomem
	);

end Behavioral;

