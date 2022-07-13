library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mips_component is port (
  clk: in std_logic;
  rst: in std_logic;
  output: out std_logic_vector(31 downto 0));
end mips_component;

architecture mips_1 of mips_component is
  component adder_32 port (
    A,B: IN std_logic_vector (31 downto 0); 
        S: OUT std_logic_vector(31 downto 0));
end component;
component alu port (
    ALUin1: IN std_logic_vector(31 downto 0);
     ALUin2: IN std_logic_vector(31 downto 0);
     ALUctrl: IN std_logic_vector(3 downto 0);
     ALUout1: OUT std_logic_vector(31 downto 0);
     zero: OUT std_logic);
   end component;
   
   component pc port (
     Input: in std_logic_vector(31 downto 0);
    clk, reset: in std_logic;
    O: out std_logic_vector(31 downto 0));
  end component;
  
  component instruction_memory port (
     Address: in std_logic_vector(31 downto 0);
       ReadData: out std_logic_vector(31 downto 0)); 
end component;

component register_files port (
  A: in std_logic_vector(31 downto 0);
        Addr1: in std_logic_vector(4 downto 0);
       Addr2: in  std_logic_vector(4 downto 0);
       AddrWrite: in std_logic_vector(4 downto 0);
        we: in std_logic;
        clk : in std_logic;
        C, D: out std_logic_vector(31 downto 0));
    end component;
    
    component control_memory_alu port (
    Aluop : in std_logic_vector(1 downto 0);
     Funct : in std_logic_vector(5 downto 0);
     opcode : out std_logic_vector(3 downto 0));
   end component;
   
   component control_memory port (
     opcode: in std_logic_vector(5 downto 0);
	regDat: out std_logic;
	branch: out std_logic;
	memRead: out std_logic;
	memWrite: out std_logic;
	memToReg:out std_logic;
	aluOp:out std_logic_vector(1 downto 0);
	aluSrc: out std_logic;
	regWrite: out std_logic);
	end component;
	
	component data_memory port (
        A: in std_logic_vector(31 downto 0);
        Addr1: in std_logic_vector(31 downto 0);
       AddrWrite: in std_logic_vector(31 downto 0);
        we: in std_logic;
        re: in std_logic;
        clk : in std_logic;
        C: out std_logic_vector(31 downto 0));
end component;
	
	component multiplexer5_2_to_1 port (
	 a,b: in std_logic_vector (4 downto 0);
    s: in std_logic;
    d: out std_logic_vector (4 downto 0));
  end component;
  
  component multiplexer32_2_to_1 port (
    a,b: in std_logic_vector (31 downto 0);
      s: in std_logic;
      d: out std_logic_vector (31 downto 0));
end component;

component sign_extender port(
  A: IN std_logic_vector (15 downto 0); 
        O: OUT std_logic_vector(31 downto 0));
end component;
  signal RegWrite: std_logic;
  signal ALUSrc: std_logic;
  signal MemWrite: std_logic;
  signal MemRead: std_logic;
  signal RegDst: std_logic;
  signal MemToReg: std_logic;
  signal Jump: std_logic;
  signal Zero: std_logic;
  signal Branch: std_logic;
  signal BranchTaken: std_logic;
  signal PC_FA_IM: std_logic_vector(31 downto 0);
  signal FA_PC_OUT: std_logic_vector(31 downto 0);
  signal OUT_IM: std_logic_vector(31 downto 0);
  signal FOUR: std_logic_vector(31 downto 0);
  signal outALU: std_logic_vector(31 downto 0);
  signal ALUop: std_logic_vector(1 downto 0);
  signal RegOut1: std_logic_vector(31 downto 0);
  signal RegOut2: std_logic_vector(31 downto 0);
  signal ALU_Control_out: std_logic_vector(3 downto 0);
  signal DataWriteIN: std_logic_vector(31 downto 0);
  signal MUXregOut: std_logic_vector(4 downto 0);
  signal MUXaluOut: std_logic_vector(31 downto 0);
  signal SignExOut: std_logic_vector(31 downto 0);
  signal outRAM: std_logic_vector(31 downto 0);
  signal ShiftJump2MuxJump: std_logic_vector(31 downto 0);
  signal MUXJump2PC: std_logic_vector(31 downto 0);
  signal MUXBranch2MuxJump: std_logic_vector(31 downto 0);
  signal ALUBranchOut: std_logic_vector(31 downto 0);
  signal SignExOutAligned: std_logic_vector(31 downto 0); 
 begin
   
 FOUR<=std_logic_vector(to_unsigned(4,32));
 
 FA_PC1: adder_32 port map(
  A=>PC_FA_IM,
  B=>FOUR,
  S=>FA_PC_OUT);
  signExOutAligned<=SignExOut(29 downto 0) & "00";
  
  FA_BRANCH: adder_32 port map(
  A=>FA_PC_OUT,
  B=>signExOutAligned,
  S=>ALUBranchOut);
  PC1:PC port map(
    Input=>MUXJump2PC,
    clk=> clk,
    reset=>rst,
  O=>PC_FA_IM);
  
  IM1: instruction_memory port map(
   Address => PC_FA_IM,
  ReadData=> OUT_IM);
  
  REG1: register_files port map(
        Addr1=>OUT_IM(25 downto 21),
       Addr2=> OUT_IM(20 downto 16),
       AddrWrite=> MUXregOut,
        A=>DataWriteIN,
        clk=> CLK,
        we=>RegWrite,
        C=>RegOut1,
        D=>RegOut2);
        
    OC1: control_memory port map(
      opcode=>OUT_IM(31 downto 26),
	regDat=>RegWrite,
	branch=> Branch,
	memRead=> MemRead,
	memWrite=> MemWrite,
	memToReg=> MemToReg,
	aluOp=>ALUOp,
	aluSrc=>ALUSrc,
	regWrite=>RegWrite);
	
	ALUC_1: control_memory_alu port map(
	Aluop=> ALUop,
  Funct=> OUT_IM(5 downto 0),
  opcode=> ALU_Control_out);
  
  ALU1: alu port map(
  ALUin1=> RegOut1,
     ALUin2=>MUXaluOut,
     ALUctrl=>ALU_Control_out,
     ALUout1=>outALU,
     zero=> Zero);
     
  MUXreg: multiplexer5_2_to_1 port map (
    a=> OUT_IM(20 downto 16),
    b=> OUT_IM(15 downto 11),
    s=> RegDst,
    d=>MUXregOut);
    
MUXaluIn: multiplexer32_2_to_1 port map (
  a=> RegOut2,
  b=> SignExOut,
  s=> ALUsrc,
  d=>MUXaluOut);
  
  MUXram: multiplexer32_2_to_1 port map (
  a=> outALU,
  b=> outRAM,
  d=> DataWriteIN,
  s=> MemToReg);
  
  ShiftJump2MuxJump <= FA_PC_OUT(31 downto 28) & OUT_IM(25 downto 0) & "00";
  
  MUXJump: multiplexer32_2_to_1 port map (
  a=> MUXBranch2MuxJump,
  b=> ShiftJump2MuxJump,
  s=> Jump,
  d=>MUXJump2PC);
  
  BranchTaken<= Branch and Zero;
  
  MUXbranch: multiplexer32_2_to_1 port map(
  a=> FA_PC_OUT,
  b=> ALUBranchOut,
  d=> MUXBranch2MuxJump,
  s=> BranchTaken);
  
  SignEx: sign_extender port map (
    A=> OUT_IM(15 downto 0),
    O=> SignExOut);
    
    output<=outALU;
    
end mips_1;