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
           c : out  STD_LOGIC);
end psr;

architecture Behavioral of psr is
signal psrregister: std_logic_vector (31 downto 0);
begin
psrregister(0) <= ncwp;
psrregister(23 downto 20) <= nzvc;
cwp <= psrregister(0);
c <= psrregister(20);
end Behavioral;

