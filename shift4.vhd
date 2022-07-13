LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
ENTITY shift4 IS PORT (
            D: in STD_LOGIC_VECTOR(3 DOWNTO 0);
            Enable: in STD_LOGIC;
            Load: in STD_LOGIC;
            Sin: in STD_LOGIC;
            Clock: in STD_LOGIC;
            Q: out STD_LOGIC_VECTOR(3 DOWNTO 0));
END shift4;

ARCHITECTURE dataflow OF shift4 IS
SIGNAL Qt : STD_LOGIC_VECTOR(3 DOWNTO 0);
BEGIN
PROCESS (Clock)
BEGIN
IF rising_edge(Clock) THEN
  IF Load = '1' THEN
        Qt <= D;
  ELSIF Enable='1' THEN
      Qt(0) <= Qt(1);
      Qt(1) <= Qt(2);
      Qt(2) <= Qt(3);
      Qt(3) <= Sin;
  END IF;
END IF;
END PROCESS;
Q <= Qt;
END dataflow;