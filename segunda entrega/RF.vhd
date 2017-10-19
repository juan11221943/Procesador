----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:27:25 10/16/2017 
-- Design Name: 
-- Module Name:    RF - Behavioral 
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

entity RF is
port (rs1: in std_logic_vector(5 downto 0);
		rs2: in std_logic_vector(5 downto 0);
		rd: in std_logic_vector(5 downto 0);
		dwr: in std_logic_vector(31 downto 0);
		rst: in std_logic;
      crs1 : out std_logic_vector(31 downto 0);
		crs2 : out std_logic_vector(31 downto 0));
end RF;

architecture Behavioral of RF is
type rom_type is array (63 downto 0) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= (others =>(others => '0'));                          

begin
process(rst, rs1, rs2, rd, dwr)
begin
if rst = '1' then
	crs1 <= (others => '0');
	crs2 <= (others => '0');
	ROM <= (others => "00000000000000000000000000000000");
else
	crs1 <= ROM(conv_integer(rs1));
	crs2 <= ROM(conv_integer(rs2));
	if not(rd = "000000") then
		ROM(conv_integer(rd)) <= dwr;
	end if;
end if;
ROM(0) <= (others => '0');
end process;

end Behavioral;

