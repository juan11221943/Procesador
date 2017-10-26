----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:21:38 10/25/2017 
-- Design Name: 
-- Module Name:    pcmulplex - Behavioral 
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
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pcmulplex is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
				pc4: in  STD_LOGIC_VECTOR (31 downto 0);
           disp30 : in  STD_LOGIC_VECTOR (29 downto 0);
           disp22 : in  STD_LOGIC_VECTOR (21 downto 0);
           pcsource : in  STD_LOGIC_VECTOR (1 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           npcin : out  STD_LOGIC_VECTOR (31 downto 0));
end pcmulplex;

architecture Behavioral of pcmulplex is

begin
process(pc, disp30, disp22, pcsource, aluresult)
begin
if pcsource = "00" then
	npcin <= pc4;
elsif pcsource = "01" then
	npcin <= pc + std_logic_vector(resize(signed(disp30), 32));
elsif pcsource = "10" then
	npcin <= pc + std_logic_vector(resize(signed(disp22), 32));
elsif pcsource = "11" then
	npcin <= aluresult;
end if;
end process;
end Behavioral;
--d <= c + std_logic_vector(resize(signed(a), 32))
