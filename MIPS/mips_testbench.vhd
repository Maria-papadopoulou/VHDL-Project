library ieee;
use ieee.std_logic_1164.all;

entity mips_testbench is
end mips_testbench;

architecture behavioral of mips_testbench is
component mips_component port (
  clk: in std_logic;
  rst: in std_logic;
  output: out std_logic_vector(31 downto 0));
end component;
  
  signal CLK: std_logic;
  signal RST: std_logic;
  signal OUTPUT: std_logic_vector(31 downto 0);
  
  begin
    UUT: mips_component port map(clk => CLK, rst => RST);
      
      clock: process
      variable clktmp: std_logic := '1';
      variable reset: std_logic := '1';
      
      begin
        clktmp := not clktmp;
        CLK <= clktmp;
        if(reset = '1') then
          RST <= reset;
          reset := '0';
        else
          rst <= '0';
        end if;
        wait for 50 ns;
      end process;
   end behavioral;
