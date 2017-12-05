----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:56 10/16/2017 
-- Design Name: 
-- Module Name:    omux - Behavioral 
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

entity omux is
    Port ( i13 : in  STD_LOGIC;
           imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
           crs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : out  STD_LOGIC_VECTOR (31 downto 0));
end omux;

architecture Behavioral of omux is

begin
process (i13,imm32,crs2)
begin
if i13 = '1' then
	oper2 <= imm32;
elsif i13 = '0' then
	oper2 <= crs2;
end if;
end process;
end Behavioral;

