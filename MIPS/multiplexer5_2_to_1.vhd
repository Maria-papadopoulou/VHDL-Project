LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std. all;

entity multiplexer5_2_to_1 is port
(a,b: in std_logic_vector (4 downto 0);
s: in std_logic;
d: out std_logic_vector (4 downto 0));
end multiplexer5_2_to_1;
ARCHITECTURE dataflow OF multiplexer5_2_to_1 IS
BEGIN
  d<=a WHEN s='1' ELSE b;
END dataflow;

