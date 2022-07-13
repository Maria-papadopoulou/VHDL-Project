LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec2to4 IS 
PORT 
     (a: in std_logic_vector(2 downto 1);
      d: out std_logic_vector(4 downto 1));
END dec2to4;

ARCHITECTURE dataflow OF dec2to4 IS
BEGIN  
PROCESS(a)
  BEGIN
    IF (a="00") THEN
      d<="0001";
      ELSIF (a="01") THEN
        d<="0010";
        ELSIF (a="10") THEN
        d<="0100";
        ELSE 
        d<="1000";
    END IF;  
  END PROCESS;   
END dataflow;


