----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2017 04:55:11 AM
-- Design Name: 
-- Module Name: count_logic - Behavioral
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

entity count_logic is
    Port ( direction : in std_logic_vector(3 downto 0);
           load : in STD_LOGIC;
           q : in STD_LOGIC;
           number_bit : in STD_LOGIC;
           result : out STD_LOGIC);
end count_logic;

architecture Behavioral of count_logic is
begin
    result <= not (((direction(0) and direction(1) and direction(2) and direction(3)) xor (q and load)) or ((not load) and number_bit));
end Behavioral;
