------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 29.09.2017 13:01:11
---- Design Name: 
---- Module Name: JK_trig_test - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;

---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity jk_flip_flop_testbench is
----  Port ( );
--end jk_flip_flop_testbench;

--architecture Behavioral of jk_flip_flop_testbench is
--    component jk_flip_flop is 
--         Port ( jump : in STD_LOGIC;
--               kill : in STD_LOGIC;
--               set : in STD_LOGIC;
--               reset : in STD_LOGIC;
--               clk : in STD_LOGIC;
--               q : inout STD_LOGIC;
--               not_q : inout STD_LOGIC);
--    end component;
    
--    signal jump : STD_LOGIC := '0';
--    signal kill : STD_LOGIC := '0';
--    signal set : STD_LOGIC := '1';
--    signal reset : STD_LOGIC := '1';
--    signal clk : STD_LOGIC := '0';
--    signal q : STD_LOGIC;
--    signal not_q : STD_LOGIC;
--begin
--    mapping: jk_flip_flop port map (jump, kill, set, reset, clk, q, not_q);
    
--    process
--    begin
    
--        reset <= '1';
--        wait for 10 ns;
--        reset <= '1';
--        set <= '1';
--        clk <= '0';
        
--        wait for 10 ns;
--        clk <= '1';
--        reset <= '0';
--        jump <= '1';
--        wait for 10 ns;
--        clk <= '0';
--        jump <= '0';
--        wait for 10 ns;
--        clk <= '1';
--        kill <= '1';
--        wait for 10 ns;
--        clk <= '0';
--        reset <= '1';
--        set <= '0';
--        kill <= '0';
--        wait for 10 ns;
--        clk <= '1';
--        kill <= '1';
--        jump <= '1';
--        wait for 10 ns;
--        clk <= '0';
--        wait for 10 ns;
--        clk <= '1';
--        set <= '1';
--        wait for 10 ns;
--    end process;
    

--end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jk_flip_flop_testbench is
--  Port ( );
end jk_flip_flop_testbench;

architecture Behavioral of jk_flip_flop_testbench is
    component jk_flip_flop is 
         Port ( jump : in STD_LOGIC;
               kill : in STD_LOGIC;
               set : in STD_LOGIC;
               reset : in STD_LOGIC;
               clk : in STD_LOGIC;
               q : inout STD_LOGIC;
               not_q : inout STD_LOGIC);
    end component;
    
    signal jump : STD_LOGIC;
    signal kill : STD_LOGIC;
    signal set : STD_LOGIC;
    signal reset : STD_LOGIC;
    signal clk : STD_LOGIC;
    signal q : STD_LOGIC;
    signal not_q : STD_LOGIC;
begin
    mapping: jk_flip_flop port map (jump, kill, set, reset, clk, q, not_q);
    
    process
    begin
        jump <= '0';
        kill <= '0';
        set <= '1';
        reset <= '1';
        clk <= '0';
        
        wait for 1 ns;
        set <= '0';
        clk <= '1';
        wait for 1 ns;
        reset <= '0';
        set <= '1';
        clk <= '0';
        
        wait for 1 ns;
        clk <= '1';
        reset <= '1';
        jump <= '1';
        wait for 1 ns;
        clk <= '0';
        jump <= '0';
        wait for 1 ns;
        clk <= '1';
        Kill <= '1';
        wait for 1 ns;
        clk <= '0';
        Kill <= '0';
        wait for 1 ns;
        clk <= '1';
        Kill <= '1';
        jump <= '1';
        wait for 1 ns;
        clk <= '0';
        wait for 1 ns;
        clk <= '1';
        wait for 1 ns;
        
    end process;
    

end Behavioral;
