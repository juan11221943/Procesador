----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:12:25 09/21/2017 
-- Design Name: 
-- Module Name:    reg32 - Behavioral 
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

entity reg32 is
    Port ( clk : in  STD_LOGIC;
           datain1 : in  STD_LOGIC_VECTOR (31 downto 0);
           rst1 : in  STD_LOGIC;
           dataout1 : out  STD_LOGIC_VECTOR (31 downto 0));
end reg32;


architecture Behavioral of reg32 is

begin

process(CLK, datain1, rst1)
begin 
	if rst1 = '1' then
		dataout1 <= "00000000000000000000000000000000";
	elsif rising_edge(CLK) then
		dataout1 <= datain1;
		
	end if;
end process;

end Behavioral;

