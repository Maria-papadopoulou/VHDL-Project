LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
ENTITY Adder4_tb IS
END Adder4_tb;
ARCHITECTURE simulate OF Adder4_tb IS
 COMPONENT Adder4
 PORT (
   Cin : in STD_LOGIC;
 X,Y: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
 Cout: OUT STD_LOGIC;
 S: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
 );
 END COMPONENT;
 SIGNAL X,Y: STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL Cout: STD_LOGIC;
 SIGNAL S: STD_LOGIC_VECTOR(3 DOWNTO 0);
 SIGNAL Cin : in STD_LOGIC;
BEGIN
 uut: Adder4 PORT MAP (X, Y, Cout, Cin, S);

 stimulus: PROCESS
 BEGIN
 X <= "0000"; Y <= "0101"; -- 0 + 5 => 05 (0 0101)
 WAIT FOR 100 ns;
 X <= "0001"; Y <= "0111"; -- 1 + 7 => 08 (0 1000)
 WAIT FOR 100 ns;
 X <= "0010"; Y <= "1001"; -- 2 + 9 => 0B (0 1011)
 WAIT FOR 100 ns;
 X <= "0011"; Y <= "1011"; -- 3 + B => 0E (0 1110)
 WAIT FOR 100 ns;
 X <= "0100"; Y <= "1101"; -- 4 + D => 11 (1 0001)
 WAIT FOR 100 ns;
 X <= "0101"; Y <= "1111"; -- 5 + F => 14 (1 0100)
 WAIT FOR 100 ns;
 X <= "0110"; Y <= "0001"; -- 6 + 1 => 07 (0 0111)
 WAIT FOR 100 ns;
 X <= "0111"; Y <= "0011"; -- 7 + 3 => 0A (0 1010)
 WAIT FOR 100 ns;
 X <= "1000"; Y <= "0101"; -- 8 + 5 => 0D (0 1101)
 WAIT FOR 100 ns;
 X <= "1001"; Y <= "0111"; -- 9 + 7 => 10 (1 0000)
 WAIT FOR 100 ns;

 WAIT;
 END PROCESS;
END simulate;