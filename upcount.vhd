LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY upcount IS PORT (
              CLR,CLK: in std_logic;
                    Q: out std_logic_vector (1 downto 0));
                    
END upcount;

ARCHITECTURE dataflow OF upcount IS
  SIGNAL Count: std_logic_vector(1 downto 0);
BEGIN
  upcount: PROCESS(CLK)
  BEGIN
    IF rising_edge(CLK) THEN
      IF CLK='1' THEN
        Count <= "00";
      ELSE
        Count<=Count+1;
      END IF;
    END IF;
  END PROCESS;
  Q<=Count;
END dataflow;
        