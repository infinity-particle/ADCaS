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
port(number : in std_logic_vector(3 downto 0);
     load : in std_logic;
     clk : in std_logic;
     direction : in std_logic;
     ent : in std_logic;
     enp : in std_logic;
     result : out std_logic_vector(3 downto 0);
     rco : out std_logic);
end counter;

architecture Behavioral of counter is
    signal bits : std_logic_vector(3 downto 0) := "0000";
    signal not_bits : std_logic_vector(3 downto 0) := "1111";
    signal transfers: std_logic_vector(3 downto 0) := "0000";
    signal direction_0 : std_logic_vector(3 downto 0);
    signal direction_1 : std_logic_vector(3 downto 0);
    signal direction_2 : std_logic_vector(3 downto 0);
    signal direction_3 : std_logic_vector(3 downto 0);
    signal enable : std_logic := '1';
    signal output : std_logic_vector(3 downto 0) := "0000";
    signal not_output : std_logic_vector(3 downto 0) := "1111";
    signal s : std_logic := '1';
    signal r : std_logic := '1';
    
    component jk_flip_flop is
        Port ( j : in STD_LOGIC;
               k : in STD_LOGIC;
               not_s : in STD_LOGIC;
               not_r : in STD_LOGIC;
               c : in STD_LOGIC;
               q : out STD_LOGIC;
               not_q : out STD_LOGIC);
    end component;
    
    component direction_logic is
        Port ( direction : in STD_LOGIC;
               q : in STD_LOGIC;
               result : out std_logic);
    end component;
    
    component count_logic is
        Port ( direction : in std_logic_vector(3 downto 0);
               load : in STD_LOGIC;
               q : in STD_LOGIC;
               number_bit : in STD_LOGIC;
               result : out STD_LOGIC);
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
               t : in std_logic_vector(3 downto 0);
               rco : out STD_LOGIC);
    end component;    
begin

     L0 : jk_flip_flop port map(j => bits(0), k => not_bits(0), not_s => s, not_r => r, c => clk , q => output(0), not_q => not_output(0));
     L1 : jk_flip_flop port map(j => bits(1), k => not_bits(1), not_s => s, not_r => r, c => clk , q => output(1), not_q => not_output(1));
     L2 : jk_flip_flop port map(j => bits(2), k => not_bits(2), not_s => s, not_r => r, c => clk , q => output(2), not_q => not_output(2));
     L3 : jk_flip_flop port map(j => bits(3), k => not_bits(3), not_s => s, not_r => r, c => clk , q => output(3), not_q => not_output(3));
     
     D0 : direction_logic port map(direction, output(0), transfers(0));
     D1 : direction_logic port map(direction, output(1), transfers(1)); 
     D2 : direction_logic port map(direction, output(2), transfers(2)); 
     D3 : direction_logic port map(direction, output(3), transfers(3));
     
     E0 : enable_logic port map(ent, enp, load, enable);
     
     C0 : count_logic port map(direction_0, load, output(0), number(0), bits(0));
     C1 : count_logic port map(direction_1, load, output(1), number(1), bits(1));
     C2 : count_logic port map(direction_2, load, output(2), number(2), bits(2));
     C3 : count_logic port map(direction_3, load, output(3), number(3), bits(3));
     
     R0 : rco_logic port map(direction, ent, transfers, rco);
     
     process(clk)
     begin
        direction_0 <= (others => enable);
        direction_1 <= (0 => enable, 1 => transfers(0), others => '1');
        direction_2 <= (0 => enable, 1 => transfers(0), 2 => transfers(1), others => '1');
        direction_3 <= (0 => enable, 1 => transfers(0), 2 => transfers(1), 3 => transfers(2));
     end process;  
           
    not_bits <= not bits;
    not_output <= not output;
    result <= not output;
end Behavioral; 
