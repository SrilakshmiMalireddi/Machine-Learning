----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2020 10:17:29 PM
-- Design Name: 
-- Module Name: logic - Behavioral
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

entity logic is
port (
       S_l : in STD_LOGIC_VECTOR(1 downto 0);
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin_l : in STD_LOGIC;
       l_out : out STD_LOGIC);
end logic;

architecture Behavioral of logic is

begin
l_out <= A and B when S_l<="00" else
         A or B when S_l<="01" else
         A XOR B when S_l<="10" else
         not A when S_l<= "11";
end Behavioral;
