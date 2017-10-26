----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:32:59 10/25/2017 
-- Design Name: 
-- Module Name:    rfmulplex - Behavioral 
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

entity rfmulplex is
    Port ( rfdest : in  STD_LOGIC;
           RD : in  STD_LOGIC_VECTOR (5 downto 0);
           r15 : in  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end rfmulplex;

architecture Behavioral of rfmulplex is

begin
process(rfdest, RD, r15)
begin
if rfdest = '0' then
	nrd <= RD;
elsif rfdest = '1' then
	nrd <= r15;
end if;
end process;
end Behavioral;

