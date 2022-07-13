library ieee;
use ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.numeric_std.ALL;
entity data_memory is
 generic ( dw : natural := 4;
size : natural := 4;
adrw : natural := 2);
port ( A: in std_logic_vector(dw-1 downto 0);
        Addr1: in std_logic_vector(adrw-1 downto 0);
       AddrWrite: in std_logic_vector(adrw-1 downto 0);
        we: in std_logic;
        re: in std_logic;
        clk : in std_logic;
        C: out std_logic_vector(dw-1 downto 0));      
end data_memory;
architecture behavioral of data_memory is
type regArray is array(0 to size-1) of std_logic_vector(dw-1 downto 0);
signal regfile : regArray;
begin
process(clk)
begin
 if (clk'event and clk='0') then
 if we='1' then
 regfile(to_integer(unsigned(AddrWrite)))<= A;
 end if;
if re='1' then
C<=regfile(to_integer(unsigned(Addr1)));
 end if;
 end if;
end process;
end behavioral;
