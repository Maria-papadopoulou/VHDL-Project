LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity test_multiplexer is
end test_multiplexer;

architecture test of multiplexer2to1 is
      signal A1, B1: std_logic_vector (2 downto 0);
      signal S1: std_logic;
      signal D1: std_logic_vector(2 downto 0);
  component multiplexer2to1 port (a, b: in std_logic_vector (2 downto 0); 
                                  s: in std_logic;
                                  d: out std_logic_vector(2 downto 0));
 end component;

 begin
 M1: multiplexer2to1 PORT MAP (a=>A1, b=>B1, d=>D1, s=>S1);
 process
 begin
    A1<="001"; B1<="010"; S1<='0'; WAIT FOR 20 ps;
    A1<="010"; B1<="100"; S1<='0'; WAIT FOR 20 ps;
    A1<="111"; B1<="011"; S1<='0'; WAIT FOR 20 ps;
    A1<="101"; B1<="111"; S1<='0'; WAIT FOR 20 ps;
    A1<="010"; B1<="001"; S1<='1'; WAIT FOR 20 ps;
    A1<="000"; B1<="101"; S1<='1'; WAIT FOR 20 ps;
    A1<="101"; B1<="010"; S1<='1'; WAIT FOR 20 ps;
    A1<="111"; B1<="101"; S1<='1'; WAIT FOR 20 ps;                   
end process;
end test;