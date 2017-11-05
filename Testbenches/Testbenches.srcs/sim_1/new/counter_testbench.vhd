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
    
    signal load : std_logic_vector(0 downto 0);
    signal clk : std_logic_vector(0 downto 0);
    signal direction : std_logic_vector(0 downto 0);
    signal data : std_logic_vector(3 downto 0);
    signal ent : std_logic_vector(0 downto 0);
    signal enp : std_logic_vector(0 downto 0);
    signal result : std_logic_vector(3 downto 0);
    signal rco : std_logic_vector(0 downto 0);
        
    file counter_input : text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\counter_input.txt";
    file counter_estimate: text open read_mode is "D:\BSUIR\github\ADCaS\Testbenches\Testbenches.sim\files\counter_estimate.txt";
begin
    counter_0 : counter port map (data, load(0), clk(0), direction(0), ent(0), enp(0), result, rco(0));
    
    process
        variable input_row, estimate_row : line;
        variable value_input, estimate_rco, temp : integer;
        variable estimate_result : std_logic_vector(3 downto 0);
    begin
        while not(endfile(counter_input)) and not(endfile(counter_estimate)) loop
            readline(counter_input, input_row);

            read(input_row, value_input);
            ent <= std_logic_vector(to_unsigned(value_input, ent'length));
            read(input_row, value_input);
            enp <= std_logic_vector(to_unsigned(value_input, enp'length));
            read(input_row, value_input);
            load <= std_logic_vector(to_unsigned(value_input, load'length));
            read(input_row, value_input);
            direction <= std_logic_vector(to_unsigned(value_input, direction'length));
            read(input_row, value_input);
            data(3) <= std_logic(to_unsigned(value_input, 1)(0));
            read(input_row, value_input);
            data(2) <= std_logic(to_unsigned(value_input, 1)(0));
            read(input_row, value_input);
            data(1) <= std_logic(to_unsigned(value_input, 1)(0));
            read(input_row, value_input);
            data(0) <= std_logic(to_unsigned(value_input, 1)(0));
            read(input_row, value_input);
            clk <= std_logic_vector(to_unsigned(value_input, clk'length));
            
            wait for 20 ns;
            
            readline(counter_estimate, estimate_row);
            read(estimate_row, estimate_rco);
            read(estimate_row, temp);
            estimate_result(3) := std_logic(to_unsigned(temp, 1)(0));
            read(estimate_row, temp);
            estimate_result(2) := std_logic(to_unsigned(temp, 1)(0));
            read(estimate_row, temp);
            estimate_result(1) := std_logic(to_unsigned(temp, 1)(0));
            read(estimate_row, temp);
            estimate_result(0) := std_logic(to_unsigned(temp, 1)(0));
            
            assert estimate_rco = to_integer(unsigned(rco)) report "Expected RCO = " & integer'image(estimate_rco) & ", but get RCO = " & integer'image(to_integer(unsigned(rco)));
            assert estimate_result = result report "Expected RESULT = " & integer'image(to_integer(unsigned(estimate_result))) & ", but get RESULT = " & integer'image(to_integer(unsigned(result)));
        end loop;
        wait;
    end process;

end Behavioral;
