library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity tb_control_unit is
end tb_control_unit;

architecture bench of tb_control_unit is

component control_unit is
   port(CLK, RESET,G : in std_logic;
  INA,INB,INC,IND: in std_logic_vector(31 downto 0);
  S_IN: in std_logic_vector(2 downto 0);
  Cin_in: in std_logic;
  SUM_OUT,SUM_OUT1: out std_logic_vector(31 downto 0);
  Cout_OUT,Cout_OUT1: out std_logic);
end component;

  signal CLK, RESET,G: std_logic;
  signal INA: std_logic_vector(31 downto 0);
  signal INB,INC,IND: std_logic_vector(31 downto 0);
  signal S_IN: std_logic_vector(2 downto 0);
  signal Cin_IN: std_logic;
  signal SUM_OUT,SUM_OUT1: std_logic_vector(31 downto 0);
  signal Cout_OUT,Cout_OUT1: std_logic;
  

  constant clock_period: time := 10 ns;
  signal stop_the_clock: boolean;

begin

  -- Insert values for generic parameters !!
  uut: control_unit    port map (      CLK      => CLK,
                                       RESET    => RESET,
                                       G        =>     G,
                                       INA    => INA,
                                       INB    => INB,
                                       INC =>    INC,
                                       IND    => IND,
                                       S_IN => S_IN,
                                       Cin_IN => Cin_IN,
                                       SUM_OUT => SUM_OUT,
                                       SUM_OUT1 => SUM_OUT1,
                                       Cout_OUT => Cout_OUT,
                                       Cout_OUT1 => Cout_OUT1 );

  stimulus: process
  begin
  
    -- Put initialisation code here
    wait for 10ns;
    G<='1';
    INA <="01111111111111111111111111111111";
    INB <="00000000000000000000000000001011";
    INC <="01111111111111111111111111111110";
    IND <="00000000000000000000000000000001";

    S_IN <= "000";

    Cin_IN <= '1';
    CLK<='1';
    RESET<='0';
    wait for 200ns;
    G<='0';
    RESET<='1';
    


    -- Put test bench stimulus code here

    stop_the_clock <= true;
    wait;
  end process;

  clocking: process
  begin
    while not stop_the_clock loop
      CLK <= '0', '1' after clock_period / 2;
      wait for clock_period;
    end loop;
    wait;
  end process;

end bench;