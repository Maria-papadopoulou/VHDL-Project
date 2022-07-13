LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY dec_4to16 IS PORT (
a: in std_logic_vector(4 downto 1);
d: out std_logic_vector(16 downto 1));
END dec_4to16;

ARCHITECTURE dataflow OF dec_4to16 IS
    BEGIN
    PROCESS(a)
      BEGIN
        IF (a="0000") THEN
          d<="0000000000000001";
         ELSIF (a="0001") THEN
           d<="0000000000000010";
         ELSIF (a="0010") THEN
           d<="0000000000000100";
          ELSIF(a="0011") THEN
             d<="0000000000001000";
         ELSIF (a="0100") THEN
             d<="0000000000010000";
           ELSIF (a="0101") THEN
             d<="0000000000100000";
           ELSIF (a="0110") THEN
             d<="0000000001000001";
           ELSIF (a="0111") THEN
              d<="0000000010000000";
            ELSIF (a="1000") THEN
              d<="0000000100000000";
            ELSIF (a="1001") THEN
              d<="0000001000000000";
            ELSIF (a="1010") THEN 
             d<="0000010000000000";
              ELSIF (a="1011") THEN
                d<="0000100000000000";
              ELSIF (a="1100") THEN
                d<="0001000000000000";
              ELSIF (a="1101") THEN
                d<="0010000000000000";
                ELSIF (a="1110") THEN
                d<="0100000000000000";
                ELSE
                  d<="1000000000000000";
            END IF;
      END PROCESS;
END dataflow;