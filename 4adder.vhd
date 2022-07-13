LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
 
ENTITY adder4 IS
PORT (
         Cin : in STD_LOGIC;
          ?,? : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR(3 downto 0);
           Cout : out STD_LOGIC);
END adder4;
 
ARCHITECTURE dataflow OF adder4 IS
COMPONENT adder4_tb
PORT(Cin : in STD_LOGIC;
      ?,? : in STD_LOGIC_VECTOR;
      S : out STD_LOGIC_VECTOR;
      Cout : out STD_LOGIC);
END COMPONENT;
 

SIGNAL c1,c2,c3: STD_LOGIC;
 
BEGIN
 
FA1: adder4_tb PORT MAP ( X(0), Y(0), Cin,S(0), c1);
FA2: adder4_tb PORT MAP ( X(1), Y(1), c1, S(1), c2);
FA3: adder4_tb PORT MAP ( X(2), Y(2), c2, S(2), c3);
FA4: adder4_tb PORT MAP ( X(3), Y(3), c3, S(3), Cout);
 
END dataflow;
