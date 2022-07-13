LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux_4to1 IS 
PORT 
     (a: in std_logic_vector(4 downto 1);
      d: out std_logic;
      s: in std_logic_vector(2 downto 1));
END mux_4to1;

ARCHITECTURE dataflow OF mux_4to1 IS
BEGIN
d<=a(1) WHEN s="00" ELSE
   a(2) WHEN s="01" ELSE
   a(3) WHEN s="10" ELSE
   a(4) WHEN s="11";  
END dataflow;
