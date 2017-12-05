----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:12:01 10/19/2017 
-- Design Name: 
-- Module Name:    WM - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity WM is
    Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           cwp : in  STD_LOGIC;
           op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           ncwp : out  STD_LOGIC;
           nrs1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrs2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nrd : out  STD_LOGIC_VECTOR (5 downto 0));
end WM;

architecture Behavioral of WM is

begin
process(rs1, rs2,rd,op,op3,cwp)
begin
if op = "10" then
	if op3 = "111100" then
		ncwp <= '0';
	elsif op3 = "111101" then
		ncwp <= '1';
	end if;
end if;
if (rs1 >= "11000"  and rs1 <= "11111" )then
	nrs1 <= conv_std_logic_vector(conv_integer(rs1 )  - conv_integer(cwp) * 16 , 6);
elsif rs1 >= "10000"  and rs1 <= "10111" then
	nrs1 <= conv_std_logic_vector(conv_integer(rs1 )  + conv_integer(cwp) * 16 , 6);
elsif rs1 >= "01000"  and rs1 <= "01111" then
	nrs1 <= conv_std_logic_vector(conv_integer(rs1 )  + conv_integer(cwp) * 16 , 6);
else 
	nrs1 <= conv_std_logic_vector(conv_integer(rs1), 6);
end if;
if rs2 >= "11000"  and rs2 <= "11111" then
	nrs2 <= conv_std_logic_vector(conv_integer(rs2 )  - conv_integer(cwp) * 16 , 6);
elsif rs2 >= "10000"  and rs2 <= "10111" then
	nrs2 <= conv_std_logic_vector(conv_integer(rs2 )  + conv_integer(cwp) * 16 , 6);
elsif rs2 >= "01000"  and rs2 <= "01111" then
	nrs2 <= conv_std_logic_vector(conv_integer(rs2 )  + conv_integer(cwp) * 16 , 6);
else 
	nrs2 <= conv_std_logic_vector(conv_integer(rs2), 6);
end if;
if rd >= "11000"  and rd <= "11111" then
	nrd <= conv_std_logic_vector(conv_integer(rd )  - conv_integer(cwp) * 16 , 6);
elsif rd >= "10000"  and rd <= "10111" then
	nrd <= conv_std_logic_vector(conv_integer(rd )  + conv_integer(cwp) * 16 , 6);
elsif rd >= "01000"  and rd <= "01111" then
	nrd <= conv_std_logic_vector(conv_integer(rd)  + conv_integer(cwp) * 16 , 6);
else 
	nrd <= conv_std_logic_vector(conv_integer(rd), 6);
end if;
end process;

end Behavioral;

