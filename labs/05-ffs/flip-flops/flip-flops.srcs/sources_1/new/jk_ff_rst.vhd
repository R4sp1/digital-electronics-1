library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jk_ff_rst is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           j : in STD_LOGIC;
           k : in STD_LOGIC;
           q : out STD_LOGIC;
           q_bar : out STD_LOGIC);
end jk_ff_rst;

architecture Behavioral of jk_ff_rst is
    signal s_q : std_logic;
begin
    --------------------------------------------------------
    -- p_d_ff_rst:
    -- D type flip-flop with a high-active sync reset,
    -- rising-edge clk.
    -- q(n+1) = d
    --------------------------------------------------------
    p_jk_ff_rst : process(clk)
    begin
        if rising_edge(clk) then  -- Synchronous process

            if (rst = '1') then
                s_q     <= '0';
                q       <= '0';
                q_bar   <= '1';
            else
                s_q     <= (j and not(s_q)) or (not(k) and s_q);
                q       <= s_q;
                q_bar   <= not(s_q);
            end if;    
        end if;
    end process p_jk_ff_rst;
end architecture Behavioral;
