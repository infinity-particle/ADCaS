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
port(number : in std_logic_vector(3 downto 0);
     load : in std_logic;
     clk : in std_logic;
     direction : in std_logic;
     ent : in std_logic;
     enp : in std_logic;
     result : out std_logic_vector(3 downto 0);
     rco : out std_logic);
end component;

    signal load : std_logic := '1';
    signal clk : std_logic;
    signal direction : std_logic := '1';
    signal number : std_logic_vector(3 downto 0) := "0000";
    signal ent : std_logic := '1';
    signal enp : std_logic := '1';
    signal result : std_logic_vector(3 downto 0);
    signal rco : std_logic;
    
    constant clk_period : time := 100 ns;
begin

    UUT : counter port map(number => number, load => load, clk => clk,
                             direction => direction, ent => ent, enp => enp,
                             result => result, rco => rco);
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
end Behavioral;
