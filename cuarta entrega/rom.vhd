
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
										"10010000000100000000000000000101", 
										zero, "01111111111111111111111111110111", 
										"10001000000100000000000000000110", "10001100000000010010000000000001",  
										"10000110000100000000000000000101",	"10001010000000001100000000000001",
										zero,
										"01000000000000000000000000001000", zero, 
										"00010010100000000000000000000100", "10000000101000001000000000000100", 
										"10001000000100000010000000000000", "10000110000100000010000000000000",
										"10000100000100000010000000000011", "10000010000100000010000000000010");  

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

