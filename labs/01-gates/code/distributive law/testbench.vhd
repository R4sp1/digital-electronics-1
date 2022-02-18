------------------------------------------------------------
--
-- Testbench for basic gates circuit.
-- EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_gates is
    -- Entity of testbench is always empty
end entity tb_gates;

------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------
architecture testbench of tb_gates is

    -- Testbench local signals
    signal s_x      : std_logic;
    signal s_y      : std_logic;
    signal s_z      : std_logic;
    signal s_f_left  : std_logic;
    signal s_f_right : std_logic;

begin
    -- Connecting testbench signals with gates entity
    -- (Unit Under Test)
    uut_gates : entity work.gates
        port map(
            x_i      => s_x,
            y_i      => s_y,
            z_i      => s_z,
            f_left_o  => s_f_left,
            f_right_o => s_f_right
            );

    --------------------------------------------------------
    -- Testing data generation process
    --------------------------------------------------------
    p_stimulus : process
    begin

        -- Set one test case and wait for 100 ns ...
        s_x <= '0'; s_y <= '0'; s_z <= '0'; wait for 100 ns;
        -- ... and then continue with other test cases
        s_x <= '0'; s_y <= '0'; s_z <= '1'; wait for 100 ns;
        s_x <= '0'; s_y <= '1'; s_z <= '0'; wait for 100 ns;
        s_x <= '0'; s_y <= '1'; s_z <= '1'; wait for 100 ns;
        s_x <= '1'; s_y <= '0'; s_z <= '0'; wait for 100 ns;
        s_x <= '1'; s_y <= '0'; s_z <= '1'; wait for 100 ns;
        s_x <= '1'; s_y <= '1'; s_z <= '0'; wait for 100 ns;
        s_x <= '1'; s_y <= '1'; s_z <= '1'; wait for 100 ns;

        wait; -- Generation process is suspended forever
    end process p_stimulus;

end architecture testbench;
