--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:10:43 04/02/2021
-- Design Name:   
-- Module Name:   /home/moenne-l/4IR/TD_ArchiMat/Compteur/test_compteur.vhd
-- Project Name:  Compteur
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Compteur
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
 
ENTITY test_compteur IS
END test_compteur;
 
ARCHITECTURE behavior OF test_compteur IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Compteur
    PORT(
         CK : IN  std_logic;
         RST : IN  std_logic;
         SENS : IN  std_logic;
         LOAD : IN  std_logic;
         EN : IN  std_logic;
         Din : IN  std_logic_vector(7 downto 0);
         Dout : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CK : std_logic := '0';
   signal RST : std_logic := '0';
   signal SENS : std_logic := '0';
   signal LOAD : std_logic := '0';
   signal EN : std_logic := '0';
   signal Din : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal Dout : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant CK_period : time := 100ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Compteur PORT MAP (
          CK => CK,
          RST => RST,
          SENS => SENS,
          LOAD => LOAD,
          EN => EN,
          Din => Din,
          Dout => Dout
        );

   -- Clock process definitions
   CK_process :process
   begin
		CK <= '0';
		wait for CK_period/2;
		CK <= '1';
		wait for CK_period/2;
   end process;
 
	Din <= "00001111";
	RST <= '0', '1' after 30 ns;
	LOAD <= '1', '0' after 35 ns;
	EN <= '1','0' after 40 ns;
	SENS <= '1', '0' after 60 ns;
  
END;
