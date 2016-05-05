--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:20:02 04/17/2016
-- Design Name:   
-- Module Name:   Z:/CS401_CA/EX04/MIPS_CPU_FPGA_AND_SIM_V4/mips/ex04test.vhd
-- Project Name:  mips
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top
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
 
ENTITY ex04test IS
END ex04test;
 
ARCHITECTURE behavior OF ex04test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         writedata : INOUT  std_logic_vector(31 downto 0);
         dataadr : INOUT  std_logic_vector(31 downto 0);
         memwrite : INOUT  std_logic;
         pc : INOUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

	--BiDirs
   signal writedata : std_logic_vector(31 downto 0);
   signal dataadr : std_logic_vector(31 downto 0);
   signal memwrite : std_logic;
   signal pc : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          clk => clk,
          reset => reset,
          writedata => writedata,
          dataadr => dataadr,
          memwrite => memwrite,
          pc => pc
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
