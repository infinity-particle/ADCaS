----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/27/2017 01:38:58 PM
-- Design Name: 
-- Module Name: multiplexer_testbench - Behavioral
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
use IEEE.std_logic_unsigned.ALL;
use std.textio.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multiplexer_device_test is
--  Port ( );
end multiplexer_device_test;

architecture Behavioral of multiplexer_device_test is
    component multiplexer is
        Port ( data : std_logic_vector(7 downto 0);
               data_select : std_logic_vector(2 downto 0);
               g : in std_logic;
               y : out STD_LOGIC;
               w : out STD_LOGIC);
    end component;
    
        signal data : std_logic_vector (7 downto 0) := "00000000";
        signal data_select: std_logic_vector (2 downto 0) := "000"; 
        signal g: std_logic := '0';
        signal y_0, w_0, y_1, w_1: std_logic;
        
        for multiplexer_0 : multiplexer use entity work.multiplexer(logical_elements);
        for multiplexer_1 : multiplexer use entity work.multiplexer(serial_operators);
    begin
       multiplexer_0 : multiplexer port map (data, data_select, g, y_0, w_0);
       multiplexer_1 : multiplexer port map (data, data_select, g, y_1, w_1);
       
       process
       begin
          for i in 0 to 1 loop
                   for j in 0 to 7 loop
                        for k in 0 to 255 loop
                            data <= data + 1;
                            assert y_0 = y_1 report "Expected Y = " & integer'image(to_integer(unsigned'('0' & y_0))) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & y_1)));
                            assert w_0 = w_1 report "Expected Y = " & integer'image(to_integer(unsigned'('0' & w_0))) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & w_1)));
                            wait for 50 ns;
                        end loop;
                        data_select <= data_select + 1;
                        assert y_0 = y_1 report "Expected Y = " & integer'image(to_integer(unsigned'('0' & y_0))) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & y_1)));
                        assert w_0 = w_1 report "Expected Y = " & integer'image(to_integer(unsigned'('0' & w_0))) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & w_1))); 
                       wait for 50 ns;
                   end loop;
                   g <= '1';
                    assert y_0 = y_1 report "Expected Y = " & integer'image(to_integer(unsigned'('0' & y_0))) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & y_1)));
                    assert w_0 = w_1 report "Expected Y = " & integer'image(to_integer(unsigned'('0' & w_0))) & ", but get Y = " & integer'image(to_integer(unsigned'('0' & w_1)));
                   wait for 50 ns;
               end loop;
       end process;
end Behavioral;