LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipflopReset_test IS
END flipflopReset_test;

ARCHITECTURE test_b OF flipflopReset_test IS
  SIGNAL D1, CLK1, Q1, RSTN1: bit;
  COMPONENT flipflop_reset PORT (D, CLK: in bit;
                                     RSTN: in bit; 
                                      Q: out bit);
  END COMPONENT;
  begin 
  F1: flipflop_reset PORT MAP (D => D1, CLK => CLK1, RSTN => RSTN1, Q => Q1);
    CLOCK: PROCESS
      BEGIN
        CLK1 <= '1'; WAIT FOR 5ps;
        CLK1 <= '0'; WAIT FOR 5ps;
      END PROCESS CLOCK;
  PROCESS
    BEGIN
      RSTN1 <= '1'; WAIT FOR 1ps;
      RSTN1 <= '0'; WAIT FOR 1ps; 
      RSTN1 <= '1'; WAIT FOR 1ps;
      D1 <= '1'; WAIT FOR 10ns;
      D1 <= '0'; WAIT FOR 10ps;
      D1 <= '1'; WAIT FOR 10ps;
      D1 <= '0'; WAIT FOR 10ps;
    END PROCESS;
END test_b;