entity test_mux is
end test_mux;
architecture test_b of test_mux is
signal A1, B1, S1, C1: bit;
component mux2to1 port (a, b, s: in bit; c: out bit);
end component;
begin
M1: mux2to1 PORT MAP (a=>A1, b=>B1, s=>s1, c=>c1);
process
begin
A1 <= '1'; B1 <= '0'; S1 <= '1'; wait for 20 ps;
A1 <= '1'; B1 <= '0'; S1 <= '0'; wait for 20 ps;
end process;
end test_b;