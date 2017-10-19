--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:21:39 10/16/2017
-- Design Name:   
-- Module Name:   C:/Users/SEBAS/Desktop/ja/cpu/alubench.vhd
-- Project Name:  cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alubench IS
END alubench;
 
ARCHITECTURE behavior OF alubench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         oper1 : IN  std_logic_vector(31 downto 0);
         oper2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(5 downto 0);
         result : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal oper2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal result : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          oper1 => oper1,
          oper2 => oper2,
          aluop => aluop,
          result => result
        );

   -- Clock process definitions

   -- Stimulus process
   stim_proc: process
   begin		
      aluop <= "000110";
		oper1 <= "00000000000000000000000000000010";
		oper2 <= "00000000000000000000000000000110";
      wait for 100 ns;	


      -- insert stimulus here 

      wait;
   end process;

END;
