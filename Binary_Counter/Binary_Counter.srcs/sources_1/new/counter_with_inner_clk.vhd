----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2017 05:15:04 AM
-- Design Name: 
-- Module Name: counter_with_inner_clk - Behavioral
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

entity counter_with_inner_clk is
    port(number_for_load : in std_logic_vector(3 downto 0);
         load : in std_logic;
         direction : in std_logic;
         ent : in std_logic;
         enp : in std_logic;
         clk : in std_logic;
         q : out std_logic_vector(3 downto 0);
         rco : out std_logic);
end counter_with_inner_clk;

architecture Behavioral of counter_with_inner_clk is
    component counter is
        port(data : in std_logic_vector(3 downto 0);
            load : in std_logic;
            clk : in std_logic;
            direction : in std_logic;
            ent : in std_logic;
            enp : in std_logic;
            result : out std_logic_vector(3 downto 0);
            rco : out std_logic);
    end component;
    
    signal inner_clk : STD_LOGIC := '0';
    signal period_counter: integer range 0 to 45000000 := 0;
begin

    counter_0 : counter port map (number_for_load, load, inner_clk, direction, ent, enp, q, rco);
    
    frequency_divider : process(clk)
    begin
        if rising_edge(clk) then
            if period_counter = 45000000 then 
                inner_clk <= not inner_clk;
                period_counter <= 0;
            else
                period_counter <= period_counter + 1;
            end if;
        end if;
    end process;

end Behavioral;
