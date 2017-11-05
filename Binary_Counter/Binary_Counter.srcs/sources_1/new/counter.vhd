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
port(data : in std_logic_vector(3 downto 0);
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
    signal d_0 : std_logic; 
    signal d_1 : std_logic; 
    signal d_2 : std_logic; 
    signal d_3 : std_logic;
    signal t_0 : std_logic; 
    signal t_1 : std_logic; 
    signal t_2 : std_logic; 
    signal t_3 : std_logic;
    signal enable : std_logic;
    signal q_0 : std_logic; 
    signal q_1 : std_logic; 
    signal q_2 : std_logic; 
    signal q_3 : std_logic;
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
    result(0) <= not not_q_0;
    result(1) <= not not_q_1;
    result(2) <= not not_q_2;
    result(3) <= not not_q_3;

    ENABLE_0 : enable_logic port map(ent, enp, load, enable);

    T0 : direction_logic port map(direction, q_0, not_q_0, t_0);
    T1 : direction_logic port map(direction, q_1, not_q_1, t_1);
    T2 : direction_logic port map(direction, q_2, not_q_2, t_2);
    T3 : direction_logic port map(direction, q_3, not_q_3, t_3);

    D0 : count_logic port map(enable, load, q_0, data(0), d_0);
    D1 : count_logic_1 port map(enable, t_0, load, q_1, data(1), d_1);
    D2 : count_logic_2 port map(enable, t_0, t_1, load, q_2, data(2), d_2);
    D3 : count_logic_3 port map(enable, t_0, t_1, t_2, load, q_3, data(3), d_3); 


    L0 : jk_flip_flop port map(d_0, not d_0, set, reset, clk, q_0, not_q_0);
    L1 : jk_flip_flop port map(d_1, not d_1, set, reset, clk, q_1, not_q_1);
    L2 : jk_flip_flop port map(d_2, not d_2, set, reset, clk, q_2, not_q_2);
    L3 : jk_flip_flop port map(d_3, not d_3, set, reset, clk, q_3, not_q_3);
                                
    RCO_0 : rco_logic port map(direction, ent, t_0, t_1, t_2, t_3, rco);
end Behavioral; 
