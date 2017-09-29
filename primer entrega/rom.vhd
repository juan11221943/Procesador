
library IEEE;
use ieee.std_logic_unsigned.all;
use IEEE.STD_LOGIC_1164.ALL;


entity rom is
port (
		RST : in std_logic;
      ADDR : in std_logic_vector(5 downto 0);
      DATA : out std_logic_vector(31 downto 0));
end rom;

architecture Behavioral of rom is

constant zero: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
type rom_type is array (63 downto 0) of std_logic_vector (31 downto 0);                 
    signal ROM : rom_type:= (zero , zero , zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero , zero , zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, zero, zero, zero,
										zero, zero, zero, zero, zero, "00000000000000000000000000001000", "00000000000000000000000000000100", "00000000000000000000000000000010");  
signal rdata : std_logic_vector(31 downto 0);

begin
process(rst, addr)
begin
if rst = '1' then
	DATA <= zero;
else 
 rdata <= ROM(conv_integer(ADDR));
DATA <= rdata;
end if;
end process;


end Behavioral;

