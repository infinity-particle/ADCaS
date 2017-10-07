----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2017 05:35:21 AM
-- Design Name: 
-- Module Name: and_6 - Behavioral
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

entity and_6 is
    Port ( x_0 : in std_logic;
    x_1 : in std_logic;
    x_2 : in std_logic;
    x_3 : in std_logic;
    x_4 : in std_logic;
    x_5 : in std_logic;
           y : out STD_LOGIC);
end and_6;

architecture Behavioral of and_6 is
begin
    y <= x_0 and x_1 and x_2 and x_3 and x_4 and x_5;
end Behavioral;
