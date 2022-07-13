LIBRARY ieee; 
USE ieee.std_logic_1164.all;
 
ENTITY fa IS 
PORT(A,B,Cin: IN bit; 
     S,Cout: OUT bit); 
END fa;
  
ARCHITECTURE dataflow OF fa IS
BEGIN 
    S<= A XOR B XOR Cin; 
    Cout<= ((A AND B) OR (B AND Cin) OR (A AND Cin)); 
END dataflow;
