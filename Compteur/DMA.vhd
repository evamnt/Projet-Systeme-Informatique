----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:31:21 04/15/2021 
-- Design Name: 
-- Module Name:    DMA - Behavioral 
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

entity DMA is
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
           Lecture_Ecriture : out  STD_LOGIC;
           Data_Bus : inout  STD_LOGIC_VECTOR (31 downto 0);
           Adress_Bus : out  STD_LOGIC_VECTOR (31 downto 0));
end DMA;

architecture Behavioral of DMA is
	signal bus_request : STD_LOGIC := '0';
	signal demande_accept : STD_LOGIC := '0';
	signal ecriture : STD_LOGIC := '0';
	signal lecture : STD_LOGIC := '0';
	signal lec_ecr : STD_LOGIC := '0';
	signal reg_compteur : STD_LOGIC_VECTOR (15 downto 0);
	signal reg_controle : STD_LOGIC_VECTOR (2 downto 0);
	signal reg_adresse : STD_LOGIC_VECTOR (15 downto 0);
begin
	
	process
	begin
		demande_accept <= '0';
		lecture <= '0';
		ecriture <= '0';
		lec_ecr <= '0';
		wait until rising_edge(CLK); 
		if (Demande_DMA = '1') then
			bus_request <= '1';
		end if;
		if (CS = '1') then
			if (BG = '0') then
				if (RS1 = '1' and RS2 = '0') then
					reg_compteur <= Data_Bus(15 downto 0);
				elsif (RS1 = '0' and RS2 = '1') then
					reg_controle <= Data_Bus(2 downto 0);
				else
					reg_adresse <= Data_Bus(15 downto 0);
				end if;
			else
				demande_accept <= '1';
				if (reg_controle(1) = '1') then
					lecture <= '1';
					lec_ecr <= '1';
				elsif (reg_controle(2) = '1') then
					ecriture <= '1';
					lec_ecr <= '1';
				else
					--???
				end if;
			end if;
		end if;
	end process;
		
	BR <= bus_request;
	DMA_Accept <= demande_accept;
		
end Behavioral;

