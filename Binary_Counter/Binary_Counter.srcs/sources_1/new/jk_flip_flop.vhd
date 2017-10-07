library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jk_flip_flop is
    Port ( j : in STD_LOGIC;
           k : in STD_LOGIC;
           not_s : in STD_LOGIC;
           not_r : in STD_LOGIC;
           c : in STD_LOGIC;
           q : out STD_LOGIC;
           not_q : out STD_LOGIC);
end jk_flip_flop;

architecture Behavioral of jk_flip_flop is
    signal result : std_logic;
begin
    process (c, not_s, not_r, j, k)
    begin
        if not_r = '0' then 
            result <= '0';
            --result <= '1';
        elsif not_s = '0' then
            result <= '1';
            --not_q <= '0';
        elsif rising_edge(c) and j = '1' and k = '0' then
            result <= '1';
            --not_q <= '0';
        elsif rising_edge(c) and j = '0' and k = '1' then
            result <= '0';
            --not_q <= '1';
        elsif rising_edge(c) and j = '1' and k = '1' then
            result <= not result;
        end if;
    end process;
    
    process(result)
    begin
        q <= result;
        not_q <= result;
    end process;

end Behavioral;
