LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity control_memory is port
(
	opcode: in std_logic_vector(5 downto 0);
	regDat: out std_logic;
	branch: out std_logic;
	memRead: out std_logic;
	memWrite: out std_logic;
	memToReg:out std_logic;
	aluOp:out std_logic_vector(1 downto 0);
	aluSrc: out std_logic;
	regWrite: out std_logic);
	
	end control_memory;
	
	architecture behavioral of control_memory is
	begin
  process(opcode)
    begin
	case opcode is
	when "000000" =>
		regDat<='1';
		branch<='0';
		memRead<='0';
		memToReg<='0';
		aluOp<="10";
		memWrite<='0';
		aluSrc<='0';
		regWrite<='1';
		
		when "100011"=>
		regDat<='0';
		branch<='0';
		memRead<='1';
		memToReg<='1';
		aluOp<="00";
		memWrite<='0';
		aluSrc<='1';
		regWrite<='1';
		
		when "101011"=>
		regDat<='0';
		branch<='0';
		memRead<='0';
		memToReg<='X';
		aluOp<="00";
		memWrite<='1';
		aluSrc<='1';
		regWrite<='0';
		
		when "000101"=>
		regDat<='0';
		branch<='1';
		memRead<='0';
		memToReg<='X';
		aluOp<="01";
		memWrite<='0';
		aluSrc<='0';
		regWrite<='0';
		
		when "001000"=>
		regDat<='0';
		branch<='0';
		memRead<='0';
		memToReg<='X';
		aluOp<="00";
		memWrite<='0';
		aluSrc<='1';
		regWrite<='1';
		
		when others => null;
		regDat<='0';
		branch<='0';
		memRead<='0';
		memToReg<='0';
		aluOp<="00";
		memWrite<='0';
		aluSrc<='0';
		regWrite<='0';
		end case;
		end process;
	end behavioral;
