LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.all;

ENTITY alu4 IS PORT 
   ( ALUin1: IN std_logic_vector(3 downto 0);
     ALUin2: IN std_logic_vector(3 downto 0);
     ALUctrl: IN std_logic_vector(3 downto 0);
     ALUout1: OUT std_logic_vector(3 downto 0);
     zero: OUT std_logic);
END alu4;

ARCHITECTURE dataflow OF ALU4 IS
Signal A1plusA2, A1minusA2, A1andA2, A1orA2: std_logic_vector (3 downto 0);
signal ALUresult:std_logic_vector(3 downto 0);

BEGIN
  
A1andA2 <= ALUin1 AND ALUin2;
A1orA2 <= ALUin1 OR ALUin2;
A1plusA2 <= ALUin1 + ALUin2;
A1minusA2 <= ALUin1 - ALUin2;

WITH ALUctrl SELECT ALUresult <=
A1andA2 WHEN "0000",
A1orA2 WHEN "0001",
A1plusA2 WHEN "0110",
A1minusA2 when "0111",
(others=>'0') WHEN OTHERS;

zero <= '1' WHEN ALUctrl = "0000" ELSE '0';
END dataflow;