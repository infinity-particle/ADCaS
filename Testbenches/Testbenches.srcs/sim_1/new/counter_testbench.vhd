----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2017 06:57:28 AM
-- Design Name: 
-- Module Name: counter_testbench - Behavioral
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

entity counter_testbench is
--  Port ( );
end counter_testbench;

architecture Behavioral of counter_testbench is
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
    
    signal load : std_logic;
    signal clk : std_logic;
    signal direction : std_logic;
    signal data : std_logic_vector(3 downto 0);
    signal ent : std_logic;
    signal enp : std_logic;
    signal result : std_logic_vector(3 downto 0);
    signal rco : std_logic;
        
    file counter_input : text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\counter_input.txt";
    file counter_estimate: text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\counter_estimate.txt";
begin
    counter_0 : counter port map (data, load, clk, direction, ent, enp, result, rco);
    
    process
        variable input_row, estimate_row : line;
        variable input_vector : std_logic_vector(8 downto 0);
        variable estimate_vector : std_logic_vector(4 downto 0);
    begin
        while not(endfile(counter_input)) and not(endfile(counter_estimate)) loop
            readline(counter_input, input_row);
            read(input_row, input_vector);
            
            ent <= input_vector(8);
            enp <= input_vector(7);
            load <= input_vector(6);
            direction <= input_vector(5);
            data <= input_vector(4 downto 1);
            clk <= input_vector(0);       
            
            wait for 20 ns;
            
            readline(counter_estimate, estimate_row);
            read(estimate_row, estimate_vector);
            
            assert estimate_vector(4) = rco report "Expected RCO = " & std_logic'image(estimate_vector(4)) & ", but get RCO = " & std_logic'image(rco);
            assert estimate_vector(3 downto 0) = result report "Expected RESULT = " & integer'image(to_integer(unsigned(estimate_vector(3 downto 0)))) & ", but get RESULT = " & integer'image(to_integer(unsigned(result)));
        end loop;
        wait;
    end process;

end Behavioral;
