-- Binary Multiplier with n = 4: VHDL Description

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity control_unit is
   port(CLK, RESET,G : in std_logic;
     INA,INB,INC,IND: in std_logic_vector(31 downto 0);
     S_IN: in std_logic_vector(2 downto 0);
     Cin_in: in std_logic;
     SUM_OUT,SUM_OUT1: out std_logic_vector(31 downto 0);
     Cout_OUT,Cout_OUT1: out std_logic);
end control_unit;

architecture behavior_4 of control_unit is
component thirtytwoALU 
Port (
        A_t_Alu : in STD_LOGIC_VECTOR(31 downto 0);
        B_t_Alu : in STD_LOGIC_VECTOR(31 downto 0);
        S_t_Alu : in STD_LOGIC_VECTOR(2 downto 0);
        Cin_t_Alu : in STD_LOGIC;
        Output_t : out STD_LOGIC_VECTOR(31 downto 0);
        Cout_t_Alu : out STD_LOGIC);
end component;
   type state_type is (IDLE, MUL0);
   signal state, next_state : state_type;
   signal A,B,A1,B1,A2,B2,A3,B3,A4,B4,Sum,Sum1,Sum2,Sum3,Sum4,O,O1,O2,O3,O4,O5: std_logic_vector(31 downto 0);
   signal C,C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,Z: std_logic;
   Signal Counter : integer:=0;
   signal P: std_logic_vector(2 downto 0);
   signal S,S1,S2,S3,S4: std_logic_vector(2 downto 0);

begin
AL : thirtytwoALU port map(A_t_Alu =>A,B_t_Alu =>B,S_t_Alu =>S,Cin_t_Alu =>C,Output_t =>O,Cout_t_Alu =>C1); 
AL1 : thirtytwoALU port map(A_t_Alu =>A1,B_t_Alu =>B1,S_t_Alu =>S,Cin_t_Alu =>C,Output_t =>O1,Cout_t_Alu =>C3);  
 state_register: process (CLK, RESET)
   begin
    if (RESET = '1') then
        state <= IDLE;
    elsif (CLK'event and CLK = '1') then
        state <= next_state;
    end if;
   end process;
 
   next_state_func: process (state)
   begin
     case state is
        when IDLE =>
          if G = '1' then
            next_state <= MUL0;
          else
            next_state <= IDLE;
          end if;
 
        when MUL0 =>
           next_state <= MUL0;
     end case;
   end process;
 
   datapath_func: process (CLK)
   variable CA: std_logic_vector(4 downto 0);
   begin
      if (CLK'event and CLK = '1') then
        
 
      case state is
      
           when IDLE =>
             if G = '1' then
                A <= INA;
                B <= INB;
                S <= S_IN;
                C <= Cin_IN;
                Sum <= O;
                C2 <= C1;
                A1 <= INC;
                B1 <= IND;
                Sum1 <= O1;
                C4 <= C3;                        

                
             end if;
           when MUL0 =>
             P <= "111";

            
      end case;
    end if;
   end process;
      SUM_OUT<=O;
      SUM_OUT1<=O1;
      Cout_OUT <= C2;
      Cout_OUT1 <= C4;
end behavior_4;