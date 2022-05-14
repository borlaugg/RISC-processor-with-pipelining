library ieee;
use ieee.std_logic_1164.all;

package ALUpkg is
	component alu is
		port (op : in std_logic_vector(3 downto 0); 
				yz: in std_logic_vector(1 downto 0);
				imm6 : in std_logic_vector(5 downto 0);
				imm9: in std_logic_vector(8 downto 0);
				pc,a,b: in std_logic_vector(15 downto 0);
				cz: out std_logic_vector(1 downto 0);
				y,a0,a1,a2,a3,a4,a5,a6,pc_out :out std_logic_vector(15 downto 0));
	end component;
end package; 

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.add16bit.all;
use work.add16bit.all;
use work.Nandpkg.all;
use work.ADLpkg.all;
use work.MultipleAddress.all;
use work.Beqpkg.all;
use work.Alumux.all;
use work.adipkg.all;
use work.LHIpkg.all;
use work.LWSWpkg.all;
use work.adder9pkg.all;
use work.CZmuxpckg.all;
use work.adder9pkg.all;

entity alu is
	port (op : in std_logic_vector(3 downto 0); 
			yz: in std_logic_vector(1 downto 0);
			imm6 : in std_logic_vector(5 downto 0);
			imm9: in std_logic_vector(8 downto 0);
			pc,a,b: in std_logic_vector(15 downto 0);
			cz: out std_logic_vector(1 downto 0);
			y,a0,a1,a2,a3,a4,a5,a6,pc_out :out std_logic_vector(15 downto 0));
end entity alu;

architecture Beh of alu is
signal y_0,y_1,y_2,y_5,y_7,pc_8,pc_9,y_9,pc_10,y_10,pc_11,
a0_12,a1_12,a2_12,a3_12,a4_12,a5_12,a6_12,a0_13,a1_13,a2_13,a3_13,a4_13,a5_13,a6_13,
y_15,y_1_00,y_1_11: std_logic_vector(15 downto 0);
signal cz_0, cz_1, cz_2, cz_5, cz_7, cz_8, cz_9, cz_10, cz_12, cz_13, cz_15,cz_1_00,cz_1_11: std_logic_vector(1 downto 0);
signal zero: std_logic_vector(15 downto 0):= "0000000000000000";
begin
	ADI0: ADI port map(a => a, b => imm6, c => cz_0(0), z => cz_0(1), y => y_0);
	
	ADD1: adder port map(a => a, b => b, c => cz_1_00(0), z => cz_1_00(1), y => y_1_00);
	ADL1: ADL port map(a => a, b => b, c => cz_1_11(0), z => cz_1_11(1), y => y_1_11);
	mux1: CZ_Mux port map(y_0 => y_1_00, y_1 => y_1_00, y_2 => y_1_00, y_3 => y_1_11, yz => yz, cz_0 => cz_1_00, cz_1 => cz_1_00, cz_2 => cz_1_00,
								 cz_3 => cz_1_11, cz => cz_1, y => y_1);
	
	ND2: Nand16bit port map(a => a, b=> b, c => cz_2(0), z => cz_2(1), y => y_2);
	
	
	SW5: LW_SW port map(imm => imm6, a => b, c => cz_5(0), z => cz_5(1), y => y_5);
	
	LW7: LW_SW port map(imm => imm6, a => b, c => cz_7(0), z => cz_7(1), y => y_7);
	
	BEQ8: BEQ port map(imm => imm6, pc => pc, a => a, b => b, c => cz_8(0), z => cz_8(1), y => pc_8);
	
	add9: adder port map(a => "0000000000000001", b => pc, c => cz_9(0), z => cz_9(1), y => y_9);
	JAL9: adder9 port map(imm => imm9, a => pc, y => pc_9);
	
	add10: adder port map(a => "0000000000000001", b => pc, c => cz_10(0), z => cz_10(1), y => y_10);
	JLR10: adder9 port map(imm => "000000000", a => b, y => pc_10);
	
	JRI11: adder9 port map(imm =>imm9 , a => a, y => pc_11);
	
	
	LM12: MultipleAdd port map(a => a, c => cz_12(0), z => cz_12(1), a0=> a0_12, a1=> a1_12, a2=> a2_12, a3=> a3_12, 
											 a4=> a4_12, a5=> a5_12, a6=> a6_12);
											
	SM13: MultipleAdd port map(a => a, c => cz_13(0), z => cz_13(1), a0=> a0_13, a1=> a1_13, a2=> a2_13, a3=> a3_13, 
											 a4=> a4_13, a5=> a5_13, a6=> a6_13);
	
	LHI15: LHI port map(a => imm9, c => cz_15(0), z => cz_15(1), y => y_15 );
	
	FINAL_MUXL: ALU_mux port map(pc_0 => pc, a0_0 => zero,a1_0 => zero,a2_0 => zero,a3_0 => zero,a4_0 => zero,a5_0 => zero,a6_0 => zero,y_0 => y_0,
										  pc_1 => pc,a0_1 => zero,a1_1 => zero,a2_1 => zero,a3_1 => zero,a4_1 => zero,a5_1 => zero,a6_1 => zero,y_1 => y_1,
										  pc_2 => pc,a0_2 => zero,a1_2 => zero,a2_2 => zero,a3_2 => zero,a4_2 => zero,a5_2 => zero,a6_2 => zero,y_2 => y_2,
										  pc_3 => pc,a0_3 => zero,a1_3 => zero,a2_3 => zero,a3_3 => zero,a4_3 => zero,a5_3 => zero,a6_3 => zero,y_3 => zero,
										  pc_4 => pc,a0_4 => zero,a1_4 => zero,a2_4 => zero,a3_4 => zero,a4_4 => zero,a5_4 => zero,a6_4 => zero,y_4 => zero,
										  pc_5 => pc,a0_5 => zero,a1_5 => zero,a2_5 => zero,a3_5 => zero,a4_5 => zero,a5_5 => zero,a6_5 => zero,y_5 => y_5,
										  pc_6 => pc,a0_6 => zero,a1_6 => zero,a2_6 => zero,a3_6 => zero,a4_6 => zero,a5_6 => zero,a6_6 => zero,y_6 => zero,
										  pc_7 => pc,a0_7 => zero,a1_7 => zero,a2_7 => zero,a3_7 => zero,a4_7 => zero,a5_7 => zero,a6_7 => zero,y_7 => y_7,
										  pc_8 => pc_8,a0_8 => zero,a1_8 => zero,a2_8 => zero,a3_8 => zero,a4_8 => zero,a5_8 => zero,a6_8 => zero,y_8 => zero,
										  pc_9 => pc_9,a0_9 => zero,a1_9 => zero,a2_9 => zero,a3_9 => zero,a4_9 => zero,a5_9 => zero,a6_9 => zero,y_9 => y_9,
										  pc_10 => pc_10,a0_10 => zero,a1_10 => zero,a2_10 => zero,a3_10 => zero,a4_10 => zero,a5_10 => zero,a6_10 => zero,y_10 => y_10,
										  pc_11 => pc_11,a0_11 => zero,a1_11 => zero,a2_11 => zero,a3_11 => zero,a4_11 => zero,a5_11 => zero,a6_11 => zero,y_11 => zero,
										  pc_12 => pc,a0_12 => a0_12,a1_12 => a1_12,a2_12 => a2_12,a3_12 => a3_12,a4_12 => a4_12,a5_12 => a5_12,a6_12 => a6_12,y_12 => zero,
										  pc_13 => pc,a0_13 => a0_13,a1_13 => a1_13,a2_13 => a2_13,a3_13 => a3_13,a4_13 => a4_13,a5_13 => a5_13,a6_13 => a6_13,y_13 => zero,
										  pc_14 => pc,a0_14 => zero,a1_14 => zero,a2_14 => zero,a3_14 => zero,a4_14 => zero,a5_14 => zero,a6_14 => zero,y_14 => zero,
										  pc_15 => pc,a0_15 => zero,a1_15 => zero,a2_15 => zero,a3_15 => zero,a4_15 => zero,a5_15 => zero,a6_15 => zero,y_15 => y_15,
										  opcode => op,
										  cz_0 => cz_0, cz_1 => cz_1, cz_2 => cz_2, cz_3 => "00", cz_4=> "00", cz_5 => cz_5, cz_6 => "00", cz_7 => cz_7, cz_8 => cz_8,
										  cz_9 => cz_9, cz_10 => cz_10, cz_11 => "00", cz_12 => cz_12, cz_13 => cz_13, cz_14 => "00", cz_15 => cz_15,
										  cz => cz,
										  a0 => a0,a1 => a1,a2 =>a2,a3 => a3,a4 => a4,a5 =>a5,a6 =>a6,y =>y,pc =>pc_out);
end Beh;