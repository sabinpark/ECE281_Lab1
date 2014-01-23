----------------------------------------------------------------------------------
-- Company:  USAFA - ECE 281
-- Engineer:  C3C Sabin Park 
-- 
-- Create Date:  22:47:40 01/22/2014 
-- Design Name:  Lab 1
-- Module Name:  Lab1_Park - Behavioral 
-- Project Name:  Lab 1
-- Target Devices:  FGPA
-- Tool versions:  1.0
-- Description:  Takes in a 3-bit input and converts to the 2's complement
--
-- Dependencies:  N/A
--
-- Revision:  0.01
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

entity Lab1_Park is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           C : in  STD_LOGIC;
           X : out  STD_LOGIC;
           Y : out  STD_LOGIC;
           Z : out  STD_LOGIC);
end Lab1_Park;

architecture Behavioral of Lab1_Park is
	signal A_NOT, B_NOT, C_NOT, E, F, G, H, I : STD_LOGIC;
	
begin
	-- the not's
	A_NOT <= not A;
	B_NOT <= not B;
	C_NOT <= not C;
	
	-- x component
	E <= A_NOT and C;
	F <= A_NOT and B;
	G <= A and B_NOT and C_NOT;
	X <= E or F or G;
	
	-- y component
	H <= B and C_NOT;
	I <= B_NOT and C;
	Y <= H or I;
	
	-- z component
	Z <= C;

end Behavioral;

