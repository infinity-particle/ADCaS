----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.09.2017 13:01:11
-- Design Name: 
-- Module Name: JK_trig_test - Behavioral
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

entity jk_flip_flop_testbench is
--  Port ( );
end jk_flip_flop_testbench;

architecture Behavioral of jk_flip_flop_testbench is
    component jk_flip_flop is 
         Port ( j : in STD_LOGIC;
               k : in STD_LOGIC;
               not_s : in STD_LOGIC;
               not_r : in STD_LOGIC;
               c : in STD_LOGIC;
               q : inout STD_LOGIC;
               not_q : inout STD_LOGIC);
    end component;
    
    signal j : STD_LOGIC;
    signal k : STD_LOGIC;
    signal not_s : STD_LOGIC;
    signal not_r : STD_LOGIC;
    signal c : STD_LOGIC;
    signal q : STD_LOGIC;
    signal not_q : STD_LOGIC;
begin
    mapping: jk_flip_flop port map (j, k, not_s, not_r, c, q, not_q);
    
    process
    begin
        j <= '0';
        k <= '0';
        not_s <= '1';
        not_r <= '1';
        c <= '0';
        
        wait for 1 ns;
        not_s <= '0';
        c <= '1';
        wait for 1 ns;
        not_r <= '0';
        not_s <= '1';
        c <= '0';
        
        wait for 1 ns;
        c <= '1';
        not_r <= '1';
        j <= '1';
        wait for 1 ns;
        c <= '0';
        j <= '0';
        wait for 1 ns;
        c <= '1';
        k <= '1';
        wait for 1 ns;
        c <= '0';
        k <= '0';
        wait for 1 ns;
        c <= '1';
        k <= '1';
        j <= '1';
        wait for 1 ns;
        c <= '0';
        wait for 1 ns;
        c <= '1';
        wait for 1 ns;
        
    end process;
    

end Behavioral;
