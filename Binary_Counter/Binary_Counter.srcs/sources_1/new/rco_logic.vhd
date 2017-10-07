----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2017 05:39:25 AM
-- Design Name: 
-- Module Name: rco_logic - Behavioral
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

entity rco_logic is
    Port ( direction : in STD_LOGIC;
           ent : in STD_LOGIC;
           t : in std_logic_vector(3 downto 0);
           rco : out STD_LOGIC);
end rco_logic;

architecture Behavioral of rco_logic is
    signal result, result_1 : std_logic;

component and_6 is
    Port ( x_0 : in std_logic;
    x_1 : in std_logic;
    x_2 : in std_logic;
    x_3 : in std_logic;
    x_4 : in std_logic;
    x_5 : in std_logic;
           y : out STD_LOGIC);
end component;
begin
    A0 : and_6 port map(t(0), t(1), t(2), t(3), direction, not ent, result);
    A1 : and_6 port map(t(0), t(1), t(2), t(3), not direction, not ent, result_1);
    
    rco <= not(result or result_1);  
end Behavioral;
