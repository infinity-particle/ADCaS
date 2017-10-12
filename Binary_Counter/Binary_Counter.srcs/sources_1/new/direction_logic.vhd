----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2017 04:43:40 AM
-- Design Name: 
-- Module Name: direction_logic - Behavioral
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

entity direction_logic is
    Port ( direction : in STD_LOGIC;
           q : in STD_LOGIC;
           result : out std_logic);
end direction_logic;

architecture Behavioral of direction_logic is
begin
    result <= not (direction and (not q)) or ((not direction) and q);
end Behavioral;
