library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cu is
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  cond : in STD_LOGIC_VECTOR (3 downto 0);
			  icc : in STD_lOGIC_VECTOR (3 downto 0);
			  op2 : in STD_LOGIC_VECTOR (2 downto 0);
			  rden: out std_logic;
			  wren: out std_logic;
			  rfdest: out std_logic;
			  rfsource: out std_logic_vector(1 downto 0);
			  pcsource: out std_logic_vector(1 downto 0);
			  we: out std_logic;
           aluop : out  STD_LOGIC_VECTOR (5 downto 0));
end cu;

architecture Behavioral of cu is

begin
process (op, op3, cond, icc, op2)
begin
if (op = "10") then
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
		rfsource <= "01";
		rden <= '0';
		wren <= '0';
		pcsource <= "00";
		we <= '1';
		rfdest <= '0';
elsif op = "11" then
	if op3 = "000000" then 
		aluop <= "010110";--load
		rden <= '1';
		wren <= '0';
		we <= '1';
		rfsource <= "00";
	elsif op3 = "000100" then 
		aluop <= "010111";--store
		rden <= '0';
		wren <= '1';
		we <= '0';
		rfsource <= "01";
	end if;
	rfdest <= '0';
	pcsource <= "00";
elsif op = "00" then
	if op2 = "010" then
		if cond = "1001" then --bne
			if icc(2) = '0' then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0001" then -- be
			if icc(2) = '1' then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1010" then
			if ((icc(2) or (icc(3) xor icc(1))) = '0') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0010" then
			if ((icc(2) or (icc(3) xor icc(1))) = '1') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1011" then
			if ((icc(3) xor icc(1)) = '0') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0011" then
			if ((icc(3) xor icc(1)) = '1') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1100" then
			if ((icc(0) = '0') and (icc(2) = '0')) then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0100" then
			if ((icc(0) = '1') or (icc(2) = '1')) then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1101" then
			if (icc(0) = '0') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0101" then
			if (icc(0) = '1') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1110" then
			if (icc(3) = '0') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0110" then
			if (icc(3) = '1') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1111" then
			if (icc(1) = '0') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "0111" then
			if (icc(1) = '1') then
				pcsource <= "10";
			else
				pcsource <= "00";
			end if;
		elsif cond = "1000" then
			pcsource <= "10";
		elsif cond = "0000" then
			pcsource <= "00";
		end if;
		rfsource <= "10";
		rden <= '0';
		wren <= '0';
		we <= '0';
		rfdest <= '0';
	end if;-- op branch
elsif op = "01" then
	pcsource <= "01";
	rfsource <= "10";
	rden <= '0';
	wren <= '0';
	we <= '0';
	rfdest <= '1';
end if;

end process;
end Behavioral;

