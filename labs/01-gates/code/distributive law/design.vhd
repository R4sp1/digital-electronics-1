------------------------------------------------------------
--
-- Distributive law
-- EDA Playground
--
-- Copyright (c) 2019-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;                -- Standard library
use ieee.std_logic_1164.all; -- Package for data type
                             -- and logic operations

------------------------------------------------------------
-- Entity declaration for basic gates
------------------------------------------------------------
entity gates is
    port(
        x_i      : in  std_logic; -- Three data inputs
        y_i      : in  std_logic;
        z_i      : in  std_logic;
        f_left_o  : out std_logic; -- Left side of function
        f_right_o : out std_logic  -- Right side of function
        );
end entity gates;

------------------------------------------------------------
-- Architecture body for basic gates
------------------------------------------------------------
architecture dataflow of gates is
begin
    f_left_o  <= (x_i and y_i) or (x_i and z_i);
    f_right_o <= (x_i) and (y_i or z_i);
end architecture dataflow;
