----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2020 10:41:54 PM
-- Design Name: 
-- Module Name: finalalu - Behavioral
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

entity finalalu is
port (
       A_fin : in STD_LOGIC;
       B_fin : in STD_LOGIC;
       Cin_fin : in STD_LOGIC;
       S_fin : in STD_LOGIC_VECTOR(2 downto 0);
       Cout_fin : out STD_LOGIC;
       alu_out : out STD_LOGIC);
end finalalu;

architecture Behavioral of finalalu is
component arith is
port (
    s_a : in STD_LOGIC_VECTOR(1 downto 0);
    a : in STD_LOGIC;
    cin : in STD_LOGIC;
    b_a : in STD_LOGIC;
    sum_out : out STD_LOGIC;
    cout : out STD_LOGIC);
end component;
component logic is
port (
       S_l : in STD_LOGIC_VECTOR(1 downto 0);
       A : in STD_LOGIC;
       B : in STD_LOGIC;
       Cin_l : in STD_LOGIC;
       l_out : out STD_LOGIC);
end component;
component mux2to1 is
port (
        m_in1 : in STD_LOGIC;
        m_in2 : in STD_LOGIC;
        s_m : in STD_LOGIC;
        m_out : out STD_LOGIC);
end component;
signal aout : STD_LOGIC;
signal lout : STD_LOGIC;


begin
ARITH1 : arith port map (s_a(0) => S_fin(0),s_a(1)=>S_fin(1), a => A_fin, b_a => B_fin,cin => Cin_fin, sum_out => aout,cout => Cout_fin);
L1 : logic port map (S_l(0)=>S_fin(0), S_l(1)=> S_fin(1),A => A_fin, B=>B_fin,Cin_l => Cin_fin,l_out =>lout);
MUX2 : mux2to1 port map(m_in1 => aout  ,m_in2=> lout,s_m=> S_fin(2),m_out=>alu_out);

end Behavioral;
