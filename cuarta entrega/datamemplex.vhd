----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:06:47 10/25/2017 
-- Design Name: 
-- Module Name:    datamemplex - Behavioral 
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

entity datamemplex is
    Port ( datatotem : in  STD_LOGIC_VECTOR (31 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           pc : in  STD_LOGIC_VECTOR (31 downto 0);
           rfsource : in  STD_LOGIC_VECTOR(1 downto 0);
           datatoreg : out  STD_LOGIC_VECTOR (31 downto 0));
end datamemplex;

architecture Behavioral of datamemplex is

begin
process(datatotem, aluresult, pc, rfsource)
begin
if rfsource = "00" then
	datatoreg <= datatotem;
elsif rfsource = "01" then
	datatoreg <= aluresult;
elsif rfsource <= "10" then
	datatoreg <= pc;
end if;
end process;
end Behavioral;

