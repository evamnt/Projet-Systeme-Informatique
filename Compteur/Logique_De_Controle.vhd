----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:19:02 04/15/2021 
-- Design Name: 
-- Module Name:    Logique_De_Controle - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Logique_De_Controle is
    Port ( CS : in  STD_LOGIC;
           RS1 : in  STD_LOGIC;
           RS2 : in  STD_LOGIC;
           RD : out  STD_LOGIC;
           WR : out  STD_LOGIC;
           BR : out  STD_LOGIC;
           BG : in  STD_LOGIC;
           Reset : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           Demande_DMA : in  STD_LOGIC;
           DMA_Accept : out  STD_LOGIC;
           Lecture_Ecriture : out  STD_LOGIC);
end Logique_De_Controle;

architecture Behavioral of Logique_De_Controle is

begin


end Behavioral;

