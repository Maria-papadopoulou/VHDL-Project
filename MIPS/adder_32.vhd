LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

  
ENTITY adder_32 IS
PORT (A,B: IN std_logic_vector (31 downto 0); 
        S: OUT std_logic_vector(31 downto 0));
END adder_32; 
 
ARCHITECTURE dataflow OF adder_32 IS
BEGIN
  S <= A + B;     
END dataflow;