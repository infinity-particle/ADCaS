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
    Port ( DATA : std_logic_vector(7 downto 0);
               SEL : std_logic_vector(2 downto 0);
               G : in std_logic;
               Y : out STD_LOGIC;
               W : out STD_LOGIC);
end UsingLogicalElements;

architecture Behavioral of UsingLogicalElements is
    signal temp: std_logic;
begin
    temp <= (((not SEL(2)) and (not SEL(1)) and (not SEL(0)) and DATA(0)) or
           ((not SEL(2)) and (not SEL(1)) and SEL(0) and DATA(1)) or
           ((not SEL(2)) and SEL(1) and (not SEL(0)) and DATA(2)) or
           ((not SEL(2)) and SEL(1) and SEL(0) and DATA(3)) or
           (SEL(2) and (not SEL(1)) and (not SEL(0)) and DATA(4)) or
           (SEL(2) and (not SEL(1)) and SEL(0) and DATA(5)) or
           (SEL(2) and SEL(1) and (not SEL(0)) and DATA(6)) or
           (SEL(2) and SEL(1) and SEL(0) and DATA(7))) and (not G);
    Y <= temp;
    W <= not temp;       
end Behavioral;
