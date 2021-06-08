----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2020 12:42:55 PM
-- Design Name: 
-- Module Name: fulladder - Behavioral
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

entity fulladder is
 Port ( 
    x_fa : in STD_LOGIC;
    y_fa : in STD_LOGIC; 
    z_fa : in STD_LOGIC; 
    s_fa : out STD_LOGIC; 
    c_fa : out STD_LOGIC); 
end fulladder; 
architecture Structural of fulladder is 
component halfadder is
port ( 
    a_ha : in STD_LOGIC; 
    b_ha : in STD_LOGIC;    
    c_ha : out STD_LOGIC; 
    s_ha : out STD_LOGIC); 
end component; 

signal hs,hc,tc : STD_LOGIC; 
begin 
HA1 : halfadder
port map (a_ha => x_fa,b_ha => y_fa,s_ha =>hs,c_ha => hc); 
HA2 : halfadder 
port map (a_ha =>hs,b_ha => z_fa,s_ha => s_fa,c_ha => tc); 
c_fa <= hc or tc; 
end Structural;
