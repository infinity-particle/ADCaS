library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity jk_flip_flop is
    Port ( jump : in STD_LOGIC;
           kill : in STD_LOGIC;
           set : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC;
           not_q : out STD_LOGIC);
end jk_flip_flop;

architecture Behavioral of jk_flip_flop is
    signal result, not_result : std_logic;
begin
    process (clk, set, reset, jump, kill)
            variable jk_signals : std_logic_vector(1 downto 0) := "00";
            variable rs_signals : std_logic_vector(1 downto 0) := "00";
    begin
        jk_signals(0) := jump;
        jk_signals(1) := kill;
        rs_signals(0) := reset;
        rs_signals(1) := set;
        case rs_signals is
            when "00" =>
               result <= 'U';
                not_result <= 'U';
            when "01" =>
                result <= '1';
                not_result <= '0';
            when "10" =>
               result <= '0';
                not_result <= '1';
            when "11" =>
                if rising_edge(clk) then
                    case jk_signals is
                        when "00" => result <= result; not_result <= not_result;
                        when "10" => result <= '0'; not_result <= '1';
                        when "01" => result <= '1'; not_result <= '0';
                        when "11" => result <= not_result; not_result <= not not_result;
                        when others => result <= 'U'; not_result <= 'U';
                    end case;
                end if;
            when others =>
                result <= 'U'; not_result <= 'U';
        end case;
    end process;

    q <= result;
    not_q <= not_result;
end Behavioral;
