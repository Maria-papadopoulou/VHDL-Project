LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY dec2to4 IS
PORT ( a : IN STD_LOGIC_VECTOR(2 downto 1);
      en : IN STD_LOGIC;
      d : OUT STD_LOGIC_VECTOR(4 downto 1));
END dec2to4 ;

ARCHITECTURE dataFlow OF dec2to4 IS
SIGNAL ena: STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
ena <= en & a ;
WITH ena SELECT
d <= "0001" WHEN "100",
     "0010" WHEN "101",
     "0100" WHEN "110",
     "1000" WHEN "111",
     "0000" WHEN OTHERS;
END dataFlow;
