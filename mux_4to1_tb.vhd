LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY test_mux_4to1 IS
END test_mux_4to1;

ARCHITECTURE test_b OF test_mux_4to1 IS
SIGNAL A1: std_logic_vector(4 downto 1);
SIGNAL D1: std_logic;
SIGNAL S1: std_logic_vector(2 downto 1);

COMPONENT mux_4to1 PORT (a: in std_logic_vector(4 downto 1);
                         d: out std_logic;
                         s: in std_logic_vector(2 downto 1));
END COMPONENT;

BEGIN 
  M1: mux_4to1 PORT MAP (a=>A1,d=>D1, s=>S1);
PROCESS
	BEGIN
		A1<="0000"; S1<="00"; WAIT FOR 20 ps;
		A1<="0101"; S1<="01"; WAIT FOR 20 ps;
		A1<="1010"; S1<="10"; WAIT FOR 20 ps;
		A1<="1100"; S1<="11"; WAIT FOR 20 ps;
	END PROCESS;
END test_b;
