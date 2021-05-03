----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:30:40 05/03/2021 
-- Design Name: 
-- Module Name:    Banc_Registres - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Banc_Registres is
    Port ( adr_A : in  STD_LOGIC_VECTOR (3 downto 0);
           adr_B : in  STD_LOGIC_VECTOR (3 downto 0);
           adr_W : in  STD_LOGIC_VECTOR (3 downto 0);
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end Banc_Registres;

architecture Behavioral of Banc_Registres is
	type memoire is array (0 to 15) of STD_LOGIC_VECTOR (7 downto 0);

	signal banc : memoire;
	signal QA_aux : STD_LOGIC_VECTOR (7 downto 0);
	signal QB_aux : STD_LOGIC_VECTOR (7 downto 0);

begin

	process
	begin
	
		wait until rising_edge(CLK);
		
		if (RST = '0') then
			QA_aux <= (others => '0');
			QB_aux <= (others => '0');
			banc <= (others => x"00");
		else
			QA_aux <= banc(to_integer(unsigned(adr_A)));
			QB_aux <= banc(to_integer(unsigned(adr_B)));
			if (W = '1') then
				if (adr_W = adr_A) then
					QA_aux <= DATA;
				elsif (adr_W = adr_B) then
					QB_aux <= DATA;
				end if;
				banc(to_integer(unsigned(adr_W))) <= DATA;
			end if;
		end if;
		
	end process;
	
	QA <= QA_aux;
	QB <= QB_aux;
	
end Behavioral;

