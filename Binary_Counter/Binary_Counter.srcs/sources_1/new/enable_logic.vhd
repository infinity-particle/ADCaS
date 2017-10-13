----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/07/2017 05:13:20 AM
-- Design Name: 
-- Module Name: enable_logic - Behavioral
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

entity enable_logic is
    Port ( ent : in STD_LOGIC;
           enp : in STD_LOGIC;
           load : in STD_LOGIC;
           result : out STD_LOGIC);
end enable_logic;

architecture Behavioral of enable_logic is
begin
    result <= ((not ent) and (not enp) and load);
end Behavioral;
