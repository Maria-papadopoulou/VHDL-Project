LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY Register_4bit IS PORT (
            D: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            CLR, CLK: IN STD_LOGIC;
            Q: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END Register_4bit;

ARCHITECTURE dataflow OF Register_4bit IS
BEGIN
PROCESS (CLR, CLK)
 BEGIN
 IF CLR = '0' THEN
      Q <= "0000" ;
 ELSIF rising_edge(CLK) THEN
 Q <= D;
 END IF;
END PROCESS;
END dataflow;
