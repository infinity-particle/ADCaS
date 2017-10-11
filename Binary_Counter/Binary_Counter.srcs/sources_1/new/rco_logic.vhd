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
           t_0 : in std_logic;
           t_1 : in std_logic;
           t_2 : in std_logic;
           t_3 : in std_logic;
           rco : out STD_LOGIC);
end rco_logic;

architecture Behavioral of rco_logic is
begin
    rco <= (t_0 and t_1 and t_2 and t_3 and (not ent) and direction) nor (t_0 and t_1 and t_2 and t_3 and (not ent) and (not direction));  
end Behavioral;
