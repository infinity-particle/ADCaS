----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/14/2017 09:31:11 AM
-- Design Name: 
-- Module Name: LogicalElementsSimulation - Behavioral
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

entity LogicalElementsSimulation is
--  Port ( );
end LogicalElementsSimulation;

architecture Behavioral of LogicalElementsSimulation is
    component UsingLogicalElements
            port ( DATA : in std_logic_vector(7 downto 0);
                   SEL : in std_logic_vector(2 downto 0);
                    G : in STD_LOGIC;
                    W : out STD_LOGIC;
                    Y : out STD_LOGIC);
    end component;
    
    signal DATA : std_logic_vector (7 downto 0);
    signal SEL: std_logic_vector (2 downto 0); 
    signal G: std_logic := '0';
    signal Y, W: std_logic;
begin
    UUT: UsingLogicalElements port map ( DATA => DATA, SEL => SEL, G => G, Y => Y, W => W);
    process
    begin
        SEL <= "000";
        DATA <= "00001000";
        wait for 800 ns;
        DATA <= "00000010";
        wait for 200 ns;
        SEL <= "001";
        wait for 800 ns;
        G <= '1';
        wait;
    end process;
end Behavioral;
