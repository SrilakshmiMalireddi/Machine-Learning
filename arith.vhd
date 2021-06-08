----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/30/2020 01:17:22 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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

entity arith is
Port( 
    s_a : in STD_LOGIC_VECTOR(1 downto 0);
    a : in STD_LOGIC;
    cin : in STD_LOGIC;
    b_a : in STD_LOGIC;
    sum_out : out STD_LOGIC;
    cout : out STD_LOGIC);
end arith;

architecture Behavioral of arith is

component fulladder is
port (
    x_fa : in STD_LOGIC;
    y_fa : in STD_LOGIC; 
    z_fa : in STD_LOGIC; 
    s_fa : out STD_LOGIC; 
    c_fa : out STD_LOGIC);
end component;
component mux is
port (
    s : in STD_LOGIC_VECTOR(1 downto 0);
    b : in STD_LOGIC;
    m : out STD_LOGIC);
end component;
signal n :STD_LOGIC;
begin
M1 : mux
port map (b => b_a, s =>s_a, m => n);
FA1 : fulladder
port map(x_fa =>a,y_fa =>n,z_fa=>cin,s_fa =>sum_out,c_fa => cout);


end Behavioral;
