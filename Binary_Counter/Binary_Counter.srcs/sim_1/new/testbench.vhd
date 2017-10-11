----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2017 12:36:15 PM
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
component counter is
port(a, b, c, d : in std_logic;
     load : in std_logic;
     clk : in std_logic;
     direction : in std_logic;
     ent : in std_logic;
     enp : in std_logic;
     q_a, q_b, q_c, q_d : out std_logic;
     rco : out std_logic);
end component;

    signal load : std_logic := '1';
    signal clk : std_logic := '1';
    signal direction : std_logic := '1';
    signal a : std_logic := '0'; 
    signal b : std_logic := '0'; 
    signal c : std_logic := '0'; 
    signal d : std_logic := '0';
    signal ent : std_logic := '1';
    signal enp : std_logic := '1';
    signal q_a : std_logic := '0'; 
    signal q_b : std_logic := '0'; 
    signal q_c : std_logic := '0'; 
    signal q_d : std_logic := '0';
    signal rco : std_logic := '0';
    
    constant clk_period : time := 200 ns;
begin

    UUT : counter port map(a => a, b => b, c => c, d => d, load => load, clk => clk, direction => direction, 
    ent => ent, enp => enp, q_a => q_a, q_b => q_b, q_c => q_c, q_d => q_d, rco => rco);
    
    clk_process : process
    begin
        clk <= not clk;
        wait for clk_period/2;
    end process;
end Behavioral;