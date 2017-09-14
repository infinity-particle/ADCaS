----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2017 09:31:41 AM
-- Design Name: 
-- Module Name: SerialOperatorsSimulation - Behavioral
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

entity SerialOperatorsSimulation is
--  Port ( );
end SerialOperatorsSimulation;

architecture Behavioral of SerialOperatorsSimulation is
    component UsingSerialOperators
        port(DATA : in STD_LOGIC_VECTOR (7 downto 0);
               SEL : in STD_LOGIC_VECTOR (2 downto 0);
               G : in STD_LOGIC;
               Y : out STD_LOGIC;
               W : out STD_LOGIC);
    end component;
    
    signal DATA : std_logic_vector(7 downto 0);
    signal SEL : std_logic_vector(2 downto 0);
    signal G : std_logic := '0'; 
    signal Y, W : std_logic;
begin
    UUT: UsingSerialOperators port map ( DATA => DATA, SEL => SEL, G => G, Y => Y, W => W);
    
    process
    begin
        SEL <= "000";
        DATA <= "00000001";
        wait for 800 ns;
        G <= '1';
        wait;
    end process;
end Behavioral;
