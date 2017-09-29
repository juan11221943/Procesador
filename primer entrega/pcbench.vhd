--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:53:11 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/SEBAS/Desktop/cpu/proc/pcbench.vhd
-- Project Name:  proc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: reg32
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
 
ENTITY pcbench IS
END pcbench;
 
ARCHITECTURE behavior OF pcbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT reg32
    PORT(
         clk : IN  std_logic;
         datain1 : IN  std_logic_vector(31 downto 0);
         rst1 : IN  std_logic;
         dataout1 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal datain1 : std_logic_vector(31 downto 0) := (others => '0');
   signal rst1 : std_logic := '0';

 	--Outputs
   signal dataout1 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: reg32 PORT MAP (
          clk => clk,
          datain1 => datain1,
          rst1 => rst1,
          dataout1 => dataout1
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      datain1 <= "00000000000000000000000000000010";
      wait for 100 ns;	
		rst1 <= '1';
		datain1 <= "00000000000000000000000000000110";
		wait for 100 ns;	
		rst1 <= '0';
      -- insert stimulus here 

      wait;
   end process;

END;
