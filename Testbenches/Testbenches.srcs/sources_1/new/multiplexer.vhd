----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2017 01:30:18 PM
-- Design Name: 
-- Module Name: multiplexer - Behavioral
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

entity multiplexer is
    Port ( data : std_logic_vector(7 downto 0);
           data_select : std_logic_vector(2 downto 0);
           g : in std_logic;
           y : out STD_LOGIC;
           w : out STD_LOGIC);
end multiplexer;

architecture logical_elements of multiplexer is   
    signal result: std_logic;
begin
    result <= (((not data_select(2)) and (not data_select(1)) and (not data_select(0)) and data(0)) or
           ((not data_select(2)) and (not data_select(1)) and data_select(0) and data(1)) or
           ((not data_select(2)) and data_select(1) and (not data_select(0)) and data(2)) or
           ((not data_select(2)) and data_select(1) and data_select(0) and data(3)) or
           (data_select(2) and (not data_select(1)) and (not data_select(0)) and data(4)) or
           (data_select(2) and (not data_select(1)) and data_select(0) and data(5)) or
           (data_select(2) and data_select(1) and (not data_select(0)) and data(6)) or
           (data_select(2) and data_select(1) and data_select(0) and data(7))) and (not G);
    y <= result;
    w <= not result;
end logical_elements;

architecture serial_operators of multiplexer is
    signal result: std_logic;
begin
    process(g, data, data_select)
    begin
    if g = '0' then
        case data_select is
            when "000" => result <= data(0);
            when "001" => result <= data(1);
            when "010" => result <= data(2);
            when "011" => result <= data(3);
            when "100" => result <= data(4);
            when "101" => result <= data(5);
            when "110" => result <= data(6);
            when "111" => result <= data(7);
            when others => result <= 'X';
        end case;
    else
        result <= '0';
    end if;
    end process;
    
    y <= result;
    w <= not result;
end serial_operators;
