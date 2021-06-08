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

entity thirtytwoALU is
Port (
        A_t_Alu : in STD_LOGIC_VECTOR(31 downto 0);
        B_t_Alu : in STD_LOGIC_VECTOR(31 downto 0);
        S_t_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        Cin_t_Alu : in STD_LOGIC;
        Output_t : out STD_LOGIC_VECTOR(31 downto 0);
        Cout_t_Alu : out STD_LOGIC);
end thirtytwoALU;

architecture Behavioral of thirtytwoALU is
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
FAL1 : four_alu port map(A_Alu =>A_t_Alu(3 downto 0),B_Alu=>B_t_Alu(3 downto 0),Cin_Alu=>Cin_t_Alu,S_Alu=> S_t_Alu,Output => Output_t(3 downto 0),Cout_Alu =>c1(0));
FAL2 : four_alu port map(A_Alu =>A_t_Alu(7 downto 4),B_Alu=>B_t_Alu(7 downto 4),Cin_Alu=>c1(0),S_Alu=> S_t_Alu,Output => Output_t(7 downto 4),Cout_Alu =>c1(1));
FAL3 : four_alu port map(A_Alu =>A_t_Alu(11 downto 8),B_Alu=>B_t_Alu(11 downto 8),Cin_Alu=>c1(1),S_Alu=> S_t_Alu,Output => Output_t(11 downto 8),Cout_Alu =>c1(2));
FAL4 : four_alu port map(A_Alu =>A_t_Alu(15 downto 12),B_Alu=>B_t_Alu(15 downto 12),Cin_Alu=>c1(2),S_Alu=> S_t_Alu,Output => Output_t(15 downto 12),Cout_Alu =>c1(3));
FAL5 : four_alu port map(A_Alu =>A_t_Alu(19 downto 16),B_Alu=>B_t_Alu(19 downto 16),Cin_Alu=>c1(3),S_Alu=> S_t_Alu,Output => Output_t(19 downto 16),Cout_Alu =>c1(4));
FAL6 : four_alu port map(A_Alu =>A_t_Alu(23 downto 20),B_Alu=>B_t_Alu(23 downto 20),Cin_Alu=>c1(4),S_Alu=> S_t_Alu,Output => Output_t(23 downto 20),Cout_Alu =>c1(5));
FAL7 : four_alu port map(A_Alu =>A_t_Alu(27 downto 24),B_Alu=>B_t_Alu(27 downto 24),Cin_Alu=>c1(5),S_Alu=> S_t_Alu,Output => Output_t(27 downto 24),Cout_Alu =>c1(6));
FAL8 : four_alu port map(A_Alu =>A_t_Alu(31 downto 28),B_Alu=>B_t_Alu(31 downto 28),Cin_Alu=>c1(6),S_Alu=> S_t_Alu,Output => Output_t(31 downto 28),Cout_Alu =>Cout_t_Alu);



end Behavioral;
