----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:10:52 09/28/2017 
-- Design Name: 
-- Module Name:    cu - Behavioral 
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

entity cu is
    Port ( op2 : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end cu;

architecture Behavioral of cu is

begin
process (op2, op3)
begin
if (op2 = "10") then
		if (op3 = "000001") then 
			aluop <= "000000";--and
		elsif (op3 = "000101")then
			aluop <= "000001";--andn
		elsif (op3 = "000010")then
			aluop <= "000010";--or
		elsif (op3 = "000110")then
			aluop <= "000011";--orn
		elsif (op3 = "000011")then
			aluop <= "000100";--xor
		elsif (op3 = "000111")then
			aluop <= "000101"; --xnor
		elsif (op3 = "000100")then
			aluop <= "000110"; --sub
		elsif (op3 = "000000")then
			aluop <= "000111";--add
		elsif (op3 = "010001")then
			aluop <= "001000";--andcc
		elsif (op3 = "010101")then
			aluop <= "001001";--andncc
		elsif (op3 = "010010")then
			aluop <= "001010";--orcc
		elsif (op3 = "0010110")then
			aluop <= "001011";--orncc
		elsif (op3 = "010011")then
			aluop <= "001100";--xorcc
		elsif (op3 = "010111")then
			aluop <= "001101";--xnorcc
		elsif (op3 = "010000")then
			aluop <= "001110";--addcc
		elsif (op3 = "001000")then
			aluop <= "001111";--addx
		elsif (op3 = "011000")then
			aluop <= "010000";--addxcc
		elsif (op3 = "010100")then
			aluop <= "010001";--subcc
		elsif (op3 = "001100")then
			aluop <= "010010";--subx
		elsif (op3 = "011100")then
			aluop <= "010011";--subxcc
		elsif (op3 = "100101")then
			aluop <= "010100";--sll
		elsif (op3 = "100110")then
			aluop <= "010101";--srl
	end if;
		
end if;

end process;
end Behavioral;

