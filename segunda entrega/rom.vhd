
library IEEE;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;


entity rom is
port (
		RST : in std_logic;
      ADDR : in std_logic_vector(5 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end rom;
--"10000100000000000100000000000010"1
--"10000100000100000010000000000010"2
architecture Behavioral of rom is

constant zero: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
type rom_type is array (63 downto 0) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= (zero , zero , zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero , zero , zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, 
										"10010000000100000000000000010000", "10000100101000000000000000000001",
										"10000001111000000010000000000000", "10100000000000000110000000000011", 
										"10000001111010000010000000000000", "10110011001101000110000000000001", 
										"10110001001010000110000000000010", "10100010000100000010000000000100",
										"10100000000100000011111111111000" ,"10000010000100000010000000000101" );  

begin
process(rst, addr)
begin
if rst = '1' then
	DATA <= zero;
else 
	DATA <= ROM(conv_integer(ADDR));
 
end if;
end process;


end Behavioral;

