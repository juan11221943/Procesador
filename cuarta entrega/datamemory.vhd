----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:37 10/25/2017 
-- Design Name: 
-- Module Name:    datamemory - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity datamemory is
    Port ( rden : in  STD_LOGIC;
           wren : in  STD_LOGIC;
           crd : in  STD_LOGIC_VECTOR (31 downto 0);
			  crs1 : in STD_LOGIC_VECTOR (31 downto 0);
           aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           dataout : out  STD_LOGIC_VECTOR (31 downto 0));
end datamemory;

architecture Behavioral of datamemory is
 constant zero: std_logic_vector(31 downto 0):="00000000000000000000000000000000";
	type rom_type is array (31 downto 0) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= (others => zero);                        


begin
process(rden, wren, crd, aluresult)
begin
	if rden = '1' then
		dataout <= ROM(conv_integer(crd(4 downto 0)));
	elsif wren = '1' then
		ROM(conv_integer(aluresult(4 downto 0))) <= crs1;
	end if;
end process;
end Behavioral;

