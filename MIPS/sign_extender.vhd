LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

  
ENTITY sign_extender IS
PORT (A: IN std_logic_vector (15 downto 0); 
        O: OUT std_logic_vector(31 downto 0));
END sign_extender; 

ARCHITECTURE dataflow OF sign_extender IS
BEGIN
  O<="0000000000000000" & A WHEN A(15)='0' else
      "1111111111111111" & A;
  END dataflow;
   