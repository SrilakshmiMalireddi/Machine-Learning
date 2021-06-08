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

entity four_alu is
Port (
        A_Alu : in STD_LOGIC_VECTOR(3 downto 0);
        B_Alu : in STD_LOGIC_VECTOR(3 downto 0);
        S_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        Cin_Alu : in STD_LOGIC;
        Output : out STD_LOGIC_VECTOR(3 downto 0);
        Cout_Alu : out STD_LOGIC);
end four_alu;

architecture Behavioral of four_alu is
component finalalu is
    port (
       A_fin : in STD_LOGIC;
       B_fin : in STD_LOGIC;
       Cin_fin : in STD_LOGIC;
       S_fin : in STD_LOGIC_VECTOR(2 downto 0);
       Cout_fin : out STD_LOGIC;
       alu_out : out STD_LOGIC);
end component;

signal c : STD_LOGIC_VECTOR(2 downto 0);

begin
AL1 : finalalu port map(A_fin =>A_Alu(0),B_fin=>B_Alu(0),Cin_fin=>Cin_Alu,S_fin=> S_Alu,alu_out=>Output(0),Cout_fin =>c(0));
AL2 : finalalu port map(A_fin =>A_Alu(1),B_fin=>B_Alu(1),Cin_fin=>c(0),S_fin=> S_Alu,alu_out=>Output(1),Cout_fin => c(1));
AL3 : finalalu port map(A_fin =>A_Alu(2),B_fin=>B_Alu(2),Cin_fin=>c(1),S_fin=> S_Alu,alu_out=>Output(2),Cout_fin => c(2));
AL4 : finalalu port map(A_fin =>A_Alu(3),B_fin=>B_Alu(3),Cin_fin=>c(2),S_fin=> S_Alu,alu_out=>Output(3),Cout_fin => Cout_Alu);




end Behavioral;
