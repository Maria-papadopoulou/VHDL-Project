LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY latch IS PORT(
  D: IN bit;
  EN: IN bit;
  Q: OUT bit);
end latch;

ARCHITECTURE dataflow OF latch IS
BEGIN
  latch: PROCESS(en, D)
  BEGIN
    IF (en = '1') THEN
      Q <= D;
    END IF;
  END PROCESS;
END dataflow;
