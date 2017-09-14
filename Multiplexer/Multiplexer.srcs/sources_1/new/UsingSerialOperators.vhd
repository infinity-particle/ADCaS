----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2017 09:22:43 AM
-- Design Name: 
-- Module Name: UsingSerialOperators - Behavioral
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

entity UsingSerialOperators is
    Port ( DATA : in STD_LOGIC_VECTOR (7 downto 0);
               SEL : in STD_LOGIC_VECTOR (2 downto 0);
               G : in STD_LOGIC;
               Y : out STD_LOGIC;
               W : out STD_LOGIC);
end UsingSerialOperators;

architecture Behavioral of UsingSerialOperators is
    signal temp : std_logic;
begin
    process(G, DATA, SEL)
    begin
    if G = '0' then
        case SEL is
            when "000" => temp <= DATA(0);
            when "001" => temp <= DATA(1);
            when "010" => temp <= DATA(2);
            when "011" => temp <= DATA(3);
            when "100" => temp <= DATA(4);
            when "101" => temp <= DATA(5);
            when "110" => temp <= DATA(6);
            when "111" => temp <= DATA(7);
            when others => temp <= 'X';
        end case;
    else
        temp <= '0';
    end if;
    end process;
    
    Y <= temp;
    W <= not temp;    
end Behavioral;
