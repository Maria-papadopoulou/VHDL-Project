LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY test_flipflop IS
END test_flipflop;

ARCHITECTURE test_b of test_flipflop IS
  SIGNAL D1, CLK1, Q1: bit;
  COMPONENT flipflop PORT (D, CLK: IN bit; 
Q: OUT bit);
  END COMPONENT;
  begin 
  M1: flipflop PORT MAP (D => D1, CLK => CLK1, Q => Q1);
    CLOCK: PROCESS
      BEGIN
        CLK1 <= '1'; WAIT FOR 20ps;
        CLK1 <= '0'; WAIT FOR 20ps;
      END PROCESS CLOCK;
  PROCESS
    BEGIN
      D1 <= '1'; WAIT FOR 20ps;
      D1 <= '0'; WAIT FOR 20ps;
      D1 <= '1'; WAIT FOR 20ps;
      D1 <= '0'; WAIT FOR 20ps;
    END PROCESS;
END test_b;

