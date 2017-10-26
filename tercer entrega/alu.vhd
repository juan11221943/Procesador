----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:38:48 09/28/2017 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
			  oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  c : in std_logic;
           result : out  STD_LOGIC_VECTOR (31 downto 0));
end alu;

architecture Behavioral of alu is

begin
process (oper1, oper2, aluop)
begin
if op = "10" then
case aluop is
	when "000000" => result <= oper1 and oper2;
	when "000001" => result <= not(oper1 and oper2);
	when "000010" => result <= oper1 or oper2;
	when "000011" => result <= not(oper1 or oper2);
	when "000100" => result <= oper1 xor oper2;
	when "000101" => result <= not(oper1 xor oper2);
	when "000110" => result <= oper1 - oper2;
	when "000111" => result <= oper1 + oper2;
	--logicicc
	when "001000" => result <= oper1 and oper2;
	when "001001" => result <= not(oper1 and oper2);
	when "001010" => result <= oper1 or oper2;
	when "001011" => result <= not(oper1 or oper2);
	when "001100" => result <= oper1 xor oper2;
	when "001101" => result <= not(oper1 xor oper2);
	--armth icc
	when "010001" => result <= oper1 - oper2;--subcc
	when "001110" => result <= oper1 + oper2;--addcc
	when "010010" => result <= oper1 - oper2 - c;--subx
	when "001111" => result <= oper1 + oper2 + c;--addx
	when "010011" => result <= oper1 - oper2 - c;--subxcc
	when "010000" => result <= oper1 + oper2 + c;--addxcc
	--shift
	when "010100" => result <= std_logic_vector(unsigned(oper1) sll conv_integer(oper2));--sll
	when "010101" => result <= std_logic_vector(unsigned(oper1) srl conv_integer(oper2));--srl
	--load & store
	when "010110" => result <= "00000000000000000000000000000000";
	when "010111" => result <= oper1;
	when others => result <= (others => '0');
end case;
end if;
end process;
end Behavioral;

