----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:08:15 09/27/2017 
-- Design Name: 
-- Module Name:    npc - Behavioral 
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

entity npc is
Port ( 	clk : in  STD_LOGIC;
			datain : in  STD_LOGIC_VECTOR (31 downto 0);
			rst : in  STD_LOGIC;
			dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end npc;

architecture Behavioral of npc is

begin
process(CLK, datain, rst)
begin 
	if rst = '1' then
		dataout <= "00000000000000000000000000000000";
	elsif rising_edge(CLK) then
		dataout <= datain;
		
	end if;
end process;


end Behavioral;

