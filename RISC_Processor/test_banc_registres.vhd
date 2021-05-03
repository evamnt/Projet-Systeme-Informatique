--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:36:35 05/03/2021
-- Design Name:   
-- Module Name:   /home/minot/4IR/Projet-Systeme-Informatique/RISC_Processor/test_banc_registres.vhd
-- Project Name:  RISC_Processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Banc_Registres
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
 
ENTITY test_banc_registres IS
END test_banc_registres;
 
ARCHITECTURE behavior OF test_banc_registres IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Banc_Registres
    PORT(
         adr_A : IN  std_logic_vector(3 downto 0);
         adr_B : IN  std_logic_vector(3 downto 0);
         adr_W : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal adr_A : std_logic_vector(3 downto 0) := (others => '0');
   signal adr_B : std_logic_vector(3 downto 0) := (others => '0');
   signal adr_W : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Banc_Registres PORT MAP (
          adr_A => adr_A,
          adr_B => adr_B,
          adr_W => adr_W,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
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
		W <= '1';
		DATA <= "00001111", "00010000" after 30 ns;
		adr_W <= "0000", "0001" after 30 ns;
		adr_A <= "0000";
		adr_B <= "0001";
		
		wait;
   end process;

END;
