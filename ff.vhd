LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipflop IS PORT (
  D:  IN bit;
  CLK: IN bit;
  Q: OUT bit);
END flipflop;

ARCHITECTURE dataflow OF flipflop IS
BEGIN
  flipflop: PROCESS(CLK)
  BEGIN
    IF (CLK' EVENT AND CLK = '1') THEN
      Q <= D;
    END IF;
  END PROCESS;
END dataflow;
