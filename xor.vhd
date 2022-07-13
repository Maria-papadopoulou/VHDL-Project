LIBRARY ieee; 
USE ieee.std_logic_1164.all;
  
ENTITY ha IS
PORT (A,B: IN bit; 
      S,C: OUT bit); 
END ha; 
 
ARCHITECTURE dataflow OF ha IS
BEGIN
  C <= A AND B;  
  S<=A XOR B;   
END dataflow;