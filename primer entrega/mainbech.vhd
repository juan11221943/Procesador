--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:43:57 09/28/2017
-- Design Name:   
-- Module Name:   C:/Users/SEBAS/Desktop/procesador/procesador/mainbech.vhd
-- Project Name:  procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
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
 
ENTITY mainbech IS
END mainbech;
 
ARCHITECTURE behavior OF mainbech IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         clkm : IN  std_logic;
         dataoutm : OUT  std_logic_vector(31 downto 0);
         rstm : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clkm : std_logic := '0';
   signal rstm : std_logic := '0';

 	--Outputs
   signal dataoutm : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clkm_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          clkm => clkm,
          dataoutm => dataoutm,
          rstm => rstm
        );

   -- Clock process definitions
   clkm_process :process
   begin
		clkm <= '0';
		wait for clkm_period/2;
		clkm <= '1';
		wait for clkm_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      rstm <= '1';
      wait for 80 ns;	
		rstm <= '0';
      wait for 100 ns;	
		rstm <= '1';
      wait for 250 ns;

      
      wait;
   end process;

END;
