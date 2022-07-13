LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity test_flipflop is
end test_flipflop;

architecture test_a of test_flipflop is
  signal D1, CLK1, Q1: bit;
  component flipflop port (D, CLK: in bit; Q: out bit);
  end component;
  begin 
  F1: flipflop port map (D => D1, CLK => CLK1, Q => Q1);
    Roloi: process
      begin
        CLK1 <= '1'; wait for 20ps;
        CLK1 <= '0'; wait for 20ps;
      end process Roloi;
  process 
    begin
      D1 <= '1'; wait for 20ps;
      D1 <= '0'; wait for 20ps;
      D1 <= '1'; wait for 20ps;
      D1 <= '0'; wait for 20ps;
    end process;
end test_a;
