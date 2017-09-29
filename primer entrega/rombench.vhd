--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:58:54 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/SEBAS/Desktop/cpu/proc/rombench.vhd
-- Project Name:  proc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: rom
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
 
ENTITY rombench IS
END rombench;
 
ARCHITECTURE behavior OF rombench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT rom
    PORT(
         RST : IN  std_logic;
         ADDR : IN  std_logic_vector(5 downto 0);
         DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal RST : std_logic := '0';
   signal ADDR : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal DATA : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: rom PORT MAP (
          RST => RST,
          ADDR => ADDR,
          DATA => DATA
        );

   -- Clock process definitions
   
 

   -- Stimulus process
   stim_proc: process
   begin		
      addr <= "000000";
      wait for 100 ns;
		addr <= "000001";
      wait for 100 ns;
		addr <= "000010";
		wait for 150 ns;		
		rst <= '1';
      wait for 100 ns;
		addr <= "000011";
      wait for 100 ns;		
		addr <= "000100";
		
      

      -- insert stimulus here 

      wait;
   end process;

END;
