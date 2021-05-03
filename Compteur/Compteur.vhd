----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:20:55 04/02/2021 
-- Design Name: 
-- Module Name:    Compteur - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Compteur is
    Port ( CK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           SENS : in  STD_LOGIC;
           LOAD : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           Din : in  STD_LOGIC_VECTOR (7 downto 0);
           Dout : out  STD_LOGIC_VECTOR (7 downto 0));
end Compteur;

architecture Behavioral of Compteur is
	signal count: STD_LOGIC_VECTOR (7 downto 0);
begin
	process
	begin
		wait until CK = '1' and CK'event; 
		if RST = '0' then --reset
			count <= (others => '0'); 
		elsif LOAD = '1' then --load value
			count <= Din; 
		elsif EN = '0' then --si compteur enabled
			if SENS = '1' then --increment
				count <= count + 1;	
			else --decrement
				count <= count -1;
			end if;
		end if;
	end process;
	Dout <= count;
end Behavioral;

