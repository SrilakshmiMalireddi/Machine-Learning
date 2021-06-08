----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2020 10:31:24 PM
-- Design Name: 
-- Module Name: mux2to1 - Behavioral
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

entity mux2to1 is
Port (
        m_in1 : in STD_LOGIC;
        m_in2 : in STD_LOGIC;
        s_m : in STD_LOGIC;
        m_out : out STD_LOGIC);
end mux2to1;
architecture Behavioral of mux2to1 is

begin
m_out <= m_in1 when s_m <= '0' else
         m_in2 when s_m <= '1' else
         'X';
end Behavioral;
