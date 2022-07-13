LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 IS PORT (
a,b,s: IN bit;
c: OUT bit );
END mux2to1;

ARCHITECTURE dataflow OF mux2to1 IS
BEGIN
    c <= a WHEN s='1' ELSE b;
END dataflow;LIBRARY ieee ;
USE ieee.std_logic_1164.all;

ENTITY mux2to1 IS PORT (
a,b,s: IN bit;
c: OUT bit );
END mux2to1;

ARCHITECTURE dataflow OF mux2to1 IS
BEGIN
    c <= a WHEN s='1' ELSE b;
END dataflow;

