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
use ieee.std_logic_textio.all;

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
    signal g: std_logic;
    signal y, w : std_logic;

    file multiplexer_input : text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\multiplexer_input.txt";
    file multiplexer_estimate: text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\multiplexer_estimate.txt";

    for multiplexer_0 : multiplexer use entity work.multiplexer(logical_elements);
begin
    multiplexer_0 : multiplexer port map (data, data_select, g, y, w);

    process
        variable input_row, estimate_row : line;
        variable input_vector : std_logic_vector(11 downto 0);
        variable estimate_vector : std_logic_vector(1 downto 0);
    begin
        while not(endfile(multiplexer_input)) loop
            readline(multiplexer_input, input_row);
            read(input_row, input_vector);
            
            g <= input_vector(11);
            data_select <= input_vector(10 downto 8);
            data <= input_vector(7 downto 0);
            
            wait for 20 ns;
            
            readline(multiplexer_estimate, estimate_row);
            read(estimate_row, estimate_vector);
            
            assert estimate_vector(1) = y report "Expected Y = " & std_logic'image(estimate_vector(1)) & ", but get Y = " & std_logic'image(y);
            assert estimate_vector(0) = w report "Expected W = " & std_logic'image(estimate_vector(0)) & ", but get W = " & std_logic'image(w);
        end loop;
        wait;
    end process;


end Behavioral;
