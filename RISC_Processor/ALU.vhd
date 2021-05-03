----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:32:15 04/13/2021 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
USE ieee.numeric_std.ALL; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

signal Sadd : STD_LOGIC_VECTOR (8 downto 0);
signal Ssub : STD_LOGIC_VECTOR (7 downto 0);
signal Smul : STD_LOGIC_VECTOR (15 downto 0);
signal Saux : STD_LOGIC_VECTOR (7 downto 0);

begin

	Sadd <= ('0' & A) + ('0' & B);
	Ssub <= A - B;
	Smul <= A * B;
	
	Saux <= Sadd (7 downto 0) when (Ctrl_Alu = "001") else
			  Ssub when (Ctrl_Alu = "011") else
			  Smul (7 downto 0) when (Ctrl_Alu = "010") else
			  x"00";

	Z <= '1' when Saux = 0 else '0';
	C <= Sadd(8);
	O <= '0' when (Smul(15 downto 8) = "00000000") else '1';
	N <= Saux(7);
	
	S <= Saux;

end Behavioral;

