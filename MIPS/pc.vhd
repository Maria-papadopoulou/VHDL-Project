LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity pc is
  port( Input: in std_logic_vector(31 downto 0);
    clk, reset: in std_logic;
    O: out std_logic_vector(31 downto 0));
  END pc;
  
  ARCHITECTURE behavioral OF pc IS
    signal address: std_logic_vector(31 downto 0) := "00000000000000000000000000000000";
    begin
      process(clk, reset) begin
        if reset = '1' then
            address <= "00000000000000000000000000000000";
        elsif rising_edge(clk) then
              address <= Input;
       end if;
  end process;
  O <= address;
end behavioral;