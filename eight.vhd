----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2020 11:13:53 PM
-- Design Name: 
-- Module Name: 4bitalu - Behavioral
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

entity eight is
Port (
        A_e_Alu : in STD_LOGIC_VECTOR(7 downto 0);
        B_e_Alu : in STD_LOGIC_VECTOR(7 downto 0);
        S_e_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        Cin_e_Alu : in STD_LOGIC;
        Output_e : out STD_LOGIC_VECTOR(7 downto 0);
        Cout_e_Alu : out STD_LOGIC);
end eight;

architecture Behavioral of eight is
component four_alu is
Port (
        A_Alu : in STD_LOGIC_VECTOR(3 downto 0);
        B_Alu : in STD_LOGIC_VECTOR(3 downto 0);
        S_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        Cin_Alu : in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR(3 downto 0);
        Cout_Alu : out STD_LOGIC);
end component;

signal c1 : STD_LOGIC_VECTOR(7 downto 0);

begin
FAL1 : four_alu port map(A_Alu =>A_e_Alu(3 downto 0),B_Alu=>B_e_Alu(3 downto 0),Cin_Alu=>Cin_e_Alu,S_Alu=> S_e_Alu,Output => Output_e(3 downto 0),Cout_Alu =>c1(0));
FAL2 : four_alu port map(A_Alu =>A_e_Alu(7 downto 4),B_Alu=>B_e_Alu(7 downto 4),Cin_Alu=>c1(0),S_Alu=> S_e_Alu,Output => Output_e(7 downto 4),Cout_Alu =>Cout_e_Alu);




end Behavioral;
