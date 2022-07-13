library ieee;
use ieee.std_logic_1164.all;


entity control_memory_alu is
    port(
        signal Aluop : in std_logic_vector(1 downto 0);
        signal Funct : in std_logic_vector(5 downto 0);
        signal opcode : out std_logic_vector(3 downto 0)
    );
end entity control_memory_alu;


architecture behavior of control_memory_alu is 
    begin

        process(Aluop, Funct)
            begin
                case Aluop is
                    when "00" => 
                        opcode <= "0001";

                    when "01" => opcode <= "0010";

                    when "10" => 
                        case Funct is
                            when "100000" => opcode <= "0001"; 

                            when "100010" => opcode <= "0010";                             

                            when others => null;
                        end case;

                    when others => null;
                end case;
        end process;
end architecture behavior;
