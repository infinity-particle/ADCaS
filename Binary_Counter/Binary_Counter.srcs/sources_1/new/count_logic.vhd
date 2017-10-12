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
    Port ( enable : in std_logic;
           load : in STD_LOGIC;
           q : in STD_LOGIC;
           a : in STD_LOGIC;
           output : out STD_LOGIC;
           not_output : out std_logic);
end count_logic;

architecture Behavioral of count_logic is
begin
    output <= ((load and q) xor (enable)) or ((not load) and a);
    not_output <= ((load and q) xor (enable)) nor ((not load) and a); 
end Behavioral;
