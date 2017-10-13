----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/23/2017 06:09:39 PM
-- Design Name: 
-- Module Name: counter - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
port(a, b, c, d : in std_logic;
     load : in std_logic;
     clk : in std_logic;
     direction : in std_logic;
     ent : in std_logic;
     enp : in std_logic;
     --q_a, q_b, q_c, q_d : out std_logic;
     result : out std_logic_vector(3 downto 0);
     rco : out std_logic);
end counter;

architecture Behavioral of counter is
--    signal d : std_logic_vector(3 downto 0);
--    signal not_d : std_logic_vector(3 downto 0);
--    signal t: std_logic_vector(3 downto 0);
    signal d_0 : std_logic; 
    signal d_1 : std_logic; 
    signal d_2 : std_logic; 
    signal d_3 : std_logic;
    signal t_0 : std_logic; 
    signal t_1 : std_logic; 
    signal t_2 : std_logic; 
    signal t_3 : std_logic;
    signal enable : std_logic;
    --signal output : std_logic_vector(3 downto 0);
    --signal not_output : std_logic_vector(3 downto 0);
    signal q_0 : std_logic; 
    signal q_1 : std_logic; 
    signal q_2 : std_logic; 
    signal q_3 : std_logic;
--signal result : std_logic_vector(3 downto 0);
    signal not_q_0 : std_logic; 
    signal not_q_1 : std_logic; 
    signal not_q_2 : std_logic; 
    signal not_q_3 : std_logic;
    signal set : std_logic := '1';
    signal reset : std_logic := '1';
    
    component jk_flip_flop is
        Port ( jump : in STD_LOGIC;
               kill : in STD_LOGIC;
               set : in STD_LOGIC;
               reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               q : out STD_LOGIC;
               not_q : out STD_LOGIC);
    end component;
    
    component direction_logic is
        Port ( direction : in STD_LOGIC;
               q : in STD_LOGIC;
               not_q : in std_logic;
               result : out std_logic);
    end component;
    
    component enable_logic is
        Port ( ent : in STD_LOGIC;
               enp : in STD_LOGIC;
               load : in STD_LOGIC;
               result : out STD_LOGIC);
    end component;
    
    component rco_logic is
        Port ( direction : in STD_LOGIC;
               ent : in STD_LOGIC;
               t_0 : in std_logic;
               t_1 : in std_logic;
               t_2 : in std_logic;
               t_3 : in std_logic;
               rco : out STD_LOGIC);
    end component;  
     
component count_logic is
    Port ( enable : in std_logic;
           load : in STD_LOGIC;
           q : in STD_LOGIC;
           a : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

component count_logic_1 is
    Port ( enable : in std_logic;
            t_0 : in std_logic;
           load : in STD_LOGIC;
           q : in STD_LOGIC;
           b : in STD_LOGIC;
           output : out STD_LOGIC);
end component;

component count_logic_2 is
     Port ( enable : in std_logic;
           t_0 : in std_logic;
           t_1 : in std_logic;
          load : in STD_LOGIC;
          q : in STD_LOGIC;
          c : in STD_LOGIC;
          output : out STD_LOGIC);
end component;

component count_logic_3 is
    Port ( enable : in std_logic;
           t_0 : in std_logic;
           t_1 : in std_logic;
           t_2 : in std_logic;
          load : in STD_LOGIC;
          q : in STD_LOGIC;
          d : in STD_LOGIC;
          output : out STD_LOGIC);
end component;
 
begin

--     GEN_JK :
--        for i in 0 to 3 generate
--        begin
--            JK : jk_flip_flop port map(d(i), not_d(i), set, reset, clk, output(i), not_output(i));
--        end generate;
--        t_0 <= (not ((q_0 and (not direction)) or (not_q_0 and direction)));
--t_1 <= (not ((q_1 and (not direction)) or (not_q_1 and direction)));
--t_2 <= (not ((q_2 and (not direction)) or (not_q_2 and direction)));
--t_3 <= (not ((q_3 and (not direction)) or (not_q_3 and direction)));

--    q_a <= not not_q_0;
--        q_b <= not not_q_1;
--       q_c <= not not_q_2;
--       q_d <= not not_q_3;
       
       result(0) <= not not_q_0;
       result(1) <= not not_q_1;
      result(2) <= not not_q_2;
      result(3) <= not not_q_3;

    ENABLE_0 : enable_logic port map(ent, enp, load, enable);

    T0 : direction_logic port map(direction, q_0, not_q_0, t_0);
    T1 : direction_logic port map(direction, q_1, not_q_1, t_1);
    T2 : direction_logic port map(direction, q_2, not_q_2, t_2);
    T3 : direction_logic port map(direction, q_3, not_q_3, t_3);

    D0 : count_logic port map(enable, load, q_0, a, d_0);
    D1 : count_logic_1 port map(enable, t_0, load, q_1, b, d_1);
    D2 : count_logic_2 port map(enable, t_0, t_1, load, q_2, c, d_2);
    D3 : count_logic_3 port map(enable, t_0, t_1, t_2, load, q_3, d, d_3); 


     L0 : jk_flip_flop port map(d_0, not d_0, set, reset, clk, q_0, not_q_0);
     L1 : jk_flip_flop port map(d_1, not d_1, set, reset, clk, q_1, not_q_1);
     L2 : jk_flip_flop port map(d_2, not d_2, set, reset, clk, q_2, not_q_2);
     L3 : jk_flip_flop port map(d_3, not d_3, set, reset, clk, q_3, not_q_3);
                                
    RCO_0 : rco_logic port map(direction, ent, t_0, t_1, t_2, t_3, rco);
     
--     GEN_DIR_LOGIC:
--        for i in 0 to 3 generate
--            DIR_LOGIC : direction_logic port map(direction, output(i), t(i));
--        end generate GEN_DIR_LOGIC;
        
--    GEN_COUNT_LOGIC:
--        for i in 0 to 3 generate
--            COUNT_LOGIC_INSTANCE : count_logic generic map(N => i + 1) port map(enable, t(0), t(1), t(2), load, output(i), number(i), d(i));
--        end generate GEN_COUNT_LOGIC;
     
     --D0 : direction_logic port map(direction, output(0), t(0));
     --D1 : direction_logic port map(direction, output(1), t(1)); 
     --D2 : direction_logic port map(direction, output(2), t(2)); 
     --D3 : direction_logic port map(direction, output(3), t(3));
     
     --C0 : count_logic generic map(N => 4, M => 1) port map(direction_signal, load, output(0), number(0), d(0));
     --C1 : count_logic generic map(N => 4, M => 2) port map(direction_signal, load, output(1), number(1), d(1));
     --C2 : count_logic generic map(N => 4, M => 3) port map(direction_signal, load, output(2), number(2), d(2));
     --C3 : count_logic generic map(N => 4, M => 4) port map(direction_signal, load, output(3), number(3), d(3));
 
    --E0 : enable_logic port map(ent, enp, load, enable);    
    --R0 : rco_logic port map(direction, ent, t, rco);
    
    --enable <= ((not ent) and (not enp) and load);
    
--    d_0 <= (((q_0 and load) xor (((not ent) and (not enp) and load))) or ((not load) and a));
--    d_1 <= (((q_1 and load) xor (((not ent) and (not enp) and load) and t_0)) or ((not load) and b));
--    d_2 <= (((q_2 and load) xor (((not ent) and (not enp) and load) and t_0 and t_1)) or ((not load) and c));
--    d_3 <= (((q_3 and load) xor (((not ent) and (not enp) and load) and t_0 and t_1 and t_2)) or ((not load) and d));


--        enable <= (not ent) and (not enp) and load;
        
--        t_0 <= (not ((q_0 and (not direction)) or (not_q_0 and direction)));
--        t_1 <= (not ((q_1 and (not direction)) or (not_q_1 and direction)));
--        t_2 <= (not ((q_2 and (not direction)) or (not_q_2 and direction)));
--        t_3 <= (not ((q_3 and (not direction)) or (not_q_3 and direction)));
        
--        d_0 <= ((q_0 and load) xor (enable)) or ((not load) and a);
--        d_1 <= ((q_1 and load) xor (enable and t_0)) or ((not load) and b);
--        d_2 <= ((q_2 and load) xor (enable and t_0 and t_1)) or ((not load) and c);
--        d_3 <= ((q_3 and load) xor (enable and t_0 and t_1 and t_2)) or ((not load) and d);
        
--        rco <= not (t_0 and t_1 and t_2 and t_3 and direction and (not ent)) or (t_0 and t_1 and t_2 and t_3 and (not direction) and (not ent));
        
--    not_d_0 <= not d_0;
--    not_d_1 <= not d_1;
--    not_d_2 <= not d_2;
--    not_d_3 <= not d_3;
    
--    not_q_0 <= not q_0;
--   not_q_1 <= not q_1;
--   not_q_2 <= not q_2;
--   not_q_3 <= not q_3;
    
--    q_a <= not not_q_0;
--    q_b <= not not_q_1;
--    q_c <= not not_q_2;
--    q_d <= not not_q_3;
end Behavioral; 
