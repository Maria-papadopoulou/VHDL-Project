LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipflop_reset IS PORT (
D: IN bit;
CLK: IN bit;
RSTN: IN bit;
Q: OUT bit );
END flipflop_reset;

ARCHITECTURE dataflow OF flipflop_reset IS
BEGIN
  flipflop_reset: PROCESS(CLK, RSTN)
  BEGIN
    IF (RSTN = '0') THEN
      Q <= '0';
    ELSIF (CLK' EVENT AND CLK = '1') THEN
      Q <= D;
    END IF;
  END PROCESS;
END dataflow;
