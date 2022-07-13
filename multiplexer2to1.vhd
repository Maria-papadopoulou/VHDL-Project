library ieee;
use ieee.std_logic_1164.all;

entity multiplexer2to1 is 
port
(a, b: in std_logic_vector(2 downto 0);
    s: in std_logic;
    d: out std_logic_vector (2 downto 0));
end multiplexer2to1;

architecture simulation of multiplexer2to1 is
begin
      d <= a when s = '1' else b;
end simulation;