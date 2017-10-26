----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:35:11 09/28/2017 
-- Design Name: 
-- Module Name:    seu - Behavioral 
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

entity seu is
    Port ( imm13 : in  STD_LOGIC_VECTOR (12 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end seu;

architecture Behavioral of seu is

begin
process(imm13)
begin
if imm13(12) = '1' then
	dataout <= "1111111111111111111"&imm13;
else
	dataout <= "0000000000000000000"&imm13;
end if;
end process;

end Behavioral;

