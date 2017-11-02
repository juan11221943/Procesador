----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:23:33 10/18/2017 
-- Design Name: 
-- Module Name:    psrmod - Behavioral 
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

entity psrmod is
    Port ( csr1 : in  STD_LOGIC_VECTOR (31 downto 0);
           omux : in  STD_LOGIC_VECTOR (31 downto 0);
           result : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (5 downto 0);
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end psrmod;

architecture Behavioral of psrmod is
constant zero: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
begin
process (csr1, omux, result, aluop)
begin
--logical cc
if (aluop ="001000")or(aluop ="001001")or(aluop ="001010")or(aluop ="001011")or(aluop ="001100")or(aluop ="001101")then
	nzvc(3) <= result(31);
	if (result = zero)then
		nzvc(2) <= '1';
	else
		nzvc(2) <= '0';
	end if;
	nzvc(1) <= '0';
	nzvc(0) <= '0';
end if;
-- addcc - addxcc
if (aluop="001110")or(aluop="010000")then
	nzvc(3) <= result(31);
	if (result = zero)then
		nzvc(2) <= '1';
	else
		nzvc(2) <= '0';
	end if;
	nzvc(1) <= ((csr1(31) and omux(31) and (not result(31))) or ((not csr1(31)) and (not omux(31)) and result(31)));
	nzvc(0) <= (csr1(31) and omux(31)) or (not(result(31)) and (csr1(31) or omux(31)));
end if;
--subcc - subxcc
if (aluop="010001")or(aluop="010011")then
	nzvc(3) <= result(31);
	if (result = zero)then
		nzvc(2) <= '1';
	else
		nzvc(2) <= '0';
	end if;
	nzvc(1) <= ((csr1(31) and (not omux(31)) and (not result(31))) or ((not csr1(31)) and omux(31) and result(31)));
	nzvc(0) <= ((not csr1(31)) and omux(31)) or (result(31) and ((not csr1(31)) or omux(31)));
end if;
--addx
if (aluop="001111")then
	nzvc(0) <= (csr1(31) and omux(31));
end if;
--subx
if (aluop="010010")then
	nzvc(0) <= ((not csr1(31)) and omux(31));
end if;
end process;
end Behavioral;

