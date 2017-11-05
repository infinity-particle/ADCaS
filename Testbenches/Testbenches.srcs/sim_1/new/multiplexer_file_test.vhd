----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2017 12:26:56 PM
-- Design Name: 
-- Module Name: multiplexer_file_test - Behavioral
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
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer_file_test is
--  Port ( );
end multiplexer_file_test;

architecture Behavioral of multiplexer_file_test is
    component multiplexer is
    Port ( data : std_logic_vector(7 downto 0);
           data_select : std_logic_vector(2 downto 0);
           g : in std_logic;
           y : out STD_LOGIC;
           w : out STD_LOGIC);
    end component;

    signal data : std_logic_vector (7 downto 0);
    signal data_select: std_logic_vector (2 downto 0); 
    signal g: std_logic_vector(0 downto 0);
    signal y, w : std_logic;

    file multiplexer_input : text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\multiplexer_input.txt";
    file multiplexer_estimate: text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\multiplexer_estimate.txt";

    for multiplexer_0 : multiplexer use entity work.multiplexer(logical_elements);
begin
    multiplexer_0 : multiplexer port map (data, data_select, g(0), y, w);

    process
        variable input_row, estimate_row : line;
        variable temp : integer;
        variable estimate_y, estimate_w : integer;
    begin
        while not(endfile(multiplexer_input)) loop
            readline(multiplexer_input, input_row);

            read(input_row, temp);
            g <= std_logic_vector(to_unsigned(temp, g'length));
            
            read(input_row, temp);
            data_select(2) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data_select(1) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data_select(0) <= std_logic(to_unsigned(temp, 1)(0));
            
            read(input_row, temp);
            data(7) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(6) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(5) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(4) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(3) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(2) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(1) <= std_logic(to_unsigned(temp, 1)(0));
            read(input_row, temp);
            data(0) <= std_logic(to_unsigned(temp, 1)(0));
            
            wait for 20 ns;
            
            readline(multiplexer_estimate, estimate_row);
            read(estimate_row, estimate_y);
            read(estimate_row, estimate_w);
            
            assert estimate_y = to_integer(unsigned'('0' & y)) report "Expected Y = " & integer'image(estimate_y) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & y)));
            assert estimate_w = to_integer(unsigned'('0' & w)) report "Expected W = " & integer'image(to_integer(unsigned'('0' & y))) & ", but get W = " & integer'image(to_integer(unsigned'('0' & w)));
        end loop;
        wait;
    end process;


end Behavioral;
