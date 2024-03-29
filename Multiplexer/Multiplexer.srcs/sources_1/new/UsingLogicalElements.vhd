----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2017 09:21:54 AM
-- Design Name: 
-- Module Name: UsingLogicalElements - Behavioral
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

entity UsingLogicalElements is
    Port ( data : std_logic_vector(7 downto 0);
               data_select : std_logic_vector(2 downto 0);
               G : in std_logic;
               Y : out STD_LOGIC;
               W : out STD_LOGIC);
end UsingLogicalElements;

architecture Behavioral of UsingLogicalElements is
    signal temp: std_logic;
begin
    temp <= (((not data_select(2)) and (not data_select(1)) and (not data_select(0)) and data(0)) or
           ((not data_select(2)) and (not data_select(1)) and data_select(0) and data(1)) or
           ((not data_select(2)) and data_select(1) and (not data_select(0)) and data(2)) or
           ((not data_select(2)) and data_select(1) and data_select(0) and data(3)) or
           (data_select(2) and (not data_select(1)) and (not data_select(0)) and data(4)) or
           (data_select(2) and (not data_select(1)) and data_select(0) and data(5)) or
           (data_select(2) and data_select(1) and (not data_select(0)) and data(6)) or
           (data_select(2) and data_select(1) and data_select(0) and data(7))) and (not G);
    y <= temp;
    w <= not temp;       
end Behavioral;
