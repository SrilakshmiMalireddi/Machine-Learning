----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2020 12:44:55 PM
-- Design Name: 
-- Module Name: halfadder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity halfadder is 
Port ( 
    a_ha : in STD_LOGIC; 
    b_ha : in STD_LOGIC; 
    s_ha : out STD_LOGIC; 
    c_ha : out STD_LOGIC); 
 end halfadder; 
 architecture Behavioral of halfadder is 
 begin 
    s_ha <= a_ha xor b_ha;
    c_ha <= a_ha and b_ha; 
end Behavioral;
