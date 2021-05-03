--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:10:07 05/03/2021
-- Design Name:   
-- Module Name:   /home/minot/4IR/Projet-Systeme-Informatique/RISC_Processor/test_banc_memoire.vhd
-- Project Name:  RISC_Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Banc_Memoire
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
 
ENTITY test_banc_memoire IS
END test_banc_memoire;
 
ARCHITECTURE behavior OF test_banc_memoire IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Banc_Memoire
    PORT(
         adr : IN  std_logic_vector(7 downto 0);
         IN_DATA : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         OUT_DATA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adr : std_logic_vector(7 downto 0) := (others => '0');
   signal IN_DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal OUT_DATA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Banc_Memoire PORT MAP (
          adr => adr,
          IN_DATA => IN_DATA,
          RW => RW,
          RST => RST,
          CLK => CLK,
          OUT_DATA => OUT_DATA
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      RST <= '0', '1' after 10 ns;
		RW <= '1', '0' after 20 ns, '1' after 40 ns, '0' after 50 ns;
		IN_DATA <= "00001111", "00010000" after 30 ns;
		adr <= "00000000", "00000001" after 30 ns;

      wait;
   end process;

END;
