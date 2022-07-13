LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_arith.all;


ENTITY alu4_tb IS
END alu4_tb;

ARCHITECTURE dataflow of alu4_tb IS
SIGNAL ALUin1, ALUin2, ALUctrl,ALUout1: std_logic_vector(3 downto 0);
signal zero: std_logic;
COMPONENT alu4 PORT (ALUin1, ALUin2, ALUctrl,ALUout1: IN std_logic_vector(3 downto 0);
zero: OUT std_logic);
END COMPONENT;
begin
D1: alu4 PORT MAP (ALUin1 => ALUin1, ALUin2 => ALUin2,
ALUctrl => ALUctrl,ALUout1 => ALUout1,zero => zero);
process
begin
  ALUin1 <= "0010"; wait for 10ns;
  ALUin2 <= "0100"; wait for 10ns;
  ALUctrl <= "0010"; wait for 10ns;
  ALUin1 <= "0100"; wait for 10ns;
  ALUin2 <= "1111"; wait for 10ns;
  ALUctrl <= "0000"; wait for 10ns;
  ALUin1 <= "0100"; wait for 10ns;
  ALUin2 <= "1111"; wait for 10ns;
  ALUctrl <= "0001"; wait for 10ns;
  ALUin1 <= "0100"; wait for 10ns;
  ALUin2 <= "0010"; wait for 10ns;
  ALUctrl <= "0110"; wait for 10ns;
  ALUin1 <= "0100"; wait for 10ns;
  ALUin2 <= "0110"; wait for 10ns;
  ALUctrl <= "0110"; wait for 10ns;
end process;
end dataflow;
