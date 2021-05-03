----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:57:00 05/03/2021 
-- Design Name: 
-- Module Name:    Banc_Memoire - Behavioral 
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

entity Banc_Memoire is
    Port ( adr : in  STD_LOGIC_VECTOR (7 downto 0);
           IN_DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           OUT_DATA : out  STD_LOGIC_VECTOR (7 downto 0));
end Banc_Memoire;

architecture Behavioral of Banc_Memoire is

	type memoire is array (0 to 256) of STD_LOGIC_VECTOR (7 downto 0);

	signal banc : memoire;
	signal OUT_aux : STD_LOGIC_VECTOR (7 downto 0);

begin

	process
	begin
	
		wait until rising_edge(CLK);
		
		if (RST = '0') then
			OUT_aux <= (others => '0');
			banc <= (others => x"00");
		elsif (RW = '0') then
			OUT_aux <= banc(to_integer(unsigned(adr)));
		else
			banc(to_integer(unsigned(adr))) <= IN_DATA;
		end if;
		
	end process;
	
	OUT_DATA <= OUT_aux;

end Behavioral;

