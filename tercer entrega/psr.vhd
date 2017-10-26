----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:06:32 10/18/2017 
-- Design Name: 
-- Module Name:    psr - Behavioral 
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

entity psr is
    Port ( nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  ncwp : in std_logic;
			  cwp : out  STD_LOGIC;
			  icc: out STD_lOGIC_VECTOR(3 downto 0);
           c : out  STD_LOGIC);
end psr;

architecture Behavioral of psr is

begin
cwp <= ncwp;
c <= nzvc(0);
icc <= nzvc;
end Behavioral;

