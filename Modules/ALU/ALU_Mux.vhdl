library ieee;
use ieee.std_logic_1164.all;

package Alumux is
	component ALU_mux is
		port(pc_0,a0_0,a1_0,a2_0,a3_0,a4_0,a5_0,a6_0,y_0,pc_1,a0_1,a1_1,a2_1,a3_1,a4_1,a5_1,a6_1,y_1,
			  pc_2,a0_2,a1_2,a2_2,a3_2,a4_2,a5_2,a6_2,y_2,pc_3,a0_3,a1_3,a2_3,a3_3,a4_3,a5_3,a6_3,y_3,
			  pc_4,a0_4,a1_4,a2_4,a3_4,a4_4,a5_4,a6_4,y_4,pc_5,a0_5,a1_5,a2_5,a3_5,a4_5,a5_5,a6_5,y_5,
			  pc_6,a0_6,a1_6,a2_6,a3_6,a4_6,a5_6,a6_6,y_6,pc_7,a0_7,a1_7,a2_7,a3_7,a4_7,a5_7,a6_7,y_7,
			  pc_8,a0_8,a1_8,a2_8,a3_8,a4_8,a5_8,a6_8,y_8,pc_9,a0_9,a1_9,a2_9,a3_9,a4_9,a5_9,a6_9,y_9,
			  pc_10,a0_10,a1_10,a2_10,a3_10,a4_10,a5_10,a6_10,y_10,pc_11,a0_11,a1_11,a2_11,a3_11,a4_11,a5_11,a6_11,y_11,
			  pc_12,a0_12,a1_12,a2_12,a3_12,a4_12,a5_12,a6_12,y_12,pc_13,a0_13,a1_13,a2_13,a3_13,a4_13,a5_13,a6_13,y_13,
			  pc_14,a0_14,a1_14,a2_14,a3_14,a4_14,a5_14,a6_14,y_14,pc_15,a0_15,a1_15,a2_15,a3_15,a4_15,a5_15,a6_15,y_15: in std_logic_vector(15 downto 0);
			  opcode: in std_logic_vector(3 downto 0);
			  cz_0, cz_1, cz_2, cz_3, cz_4, cz_5, cz_6, cz_7, cz_8, cz_9, cz_10, cz_11, cz_12, cz_13, cz_14, cz_15: in std_logic_vector(1 downto 0);
			  cz: out std_logic_vector(1 downto 0);
			  a0,a1,a2,a3,a4,a5,a6,y,pc:out std_logic_vector(15 downto 0));
	end component ALU_mux;

end package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Mux16x1_16bit.all;
entity ALU_mux is
	port(pc_0,a0_0,a1_0,a2_0,a3_0,a4_0,a5_0,a6_0,y_0,pc_1,a0_1,a1_1,a2_1,a3_1,a4_1,a5_1,a6_1,y_1,
			  pc_2,a0_2,a1_2,a2_2,a3_2,a4_2,a5_2,a6_2,y_2,pc_3,a0_3,a1_3,a2_3,a3_3,a4_3,a5_3,a6_3,y_3,
			  pc_4,a0_4,a1_4,a2_4,a3_4,a4_4,a5_4,a6_4,y_4,pc_5,a0_5,a1_5,a2_5,a3_5,a4_5,a5_5,a6_5,y_5,
			  pc_6,a0_6,a1_6,a2_6,a3_6,a4_6,a5_6,a6_6,y_6,pc_7,a0_7,a1_7,a2_7,a3_7,a4_7,a5_7,a6_7,y_7,
			  pc_8,a0_8,a1_8,a2_8,a3_8,a4_8,a5_8,a6_8,y_8,pc_9,a0_9,a1_9,a2_9,a3_9,a4_9,a5_9,a6_9,y_9,
			  pc_10,a0_10,a1_10,a2_10,a3_10,a4_10,a5_10,a6_10,y_10,pc_11,a0_11,a1_11,a2_11,a3_11,a4_11,a5_11,a6_11,y_11,
			  pc_12,a0_12,a1_12,a2_12,a3_12,a4_12,a5_12,a6_12,y_12,pc_13,a0_13,a1_13,a2_13,a3_13,a4_13,a5_13,a6_13,y_13,
			  pc_14,a0_14,a1_14,a2_14,a3_14,a4_14,a5_14,a6_14,y_14,pc_15,a0_15,a1_15,a2_15,a3_15,a4_15,a5_15,a6_15,y_15: in std_logic_vector(15 downto 0);
			  opcode: in std_logic_vector(3 downto 0);
			  cz_0, cz_1, cz_2, cz_3, cz_4, cz_5, cz_6, cz_7, cz_8, cz_9, cz_10, cz_11, cz_12, cz_13, cz_14, cz_15: in std_logic_vector(1 downto 0);
			  cz: out std_logic_vector(1 downto 0);
			  a0,a1,a2,a3,a4,a5,a6,y,pc:out std_logic_vector(15 downto 0));
end entity ALU_mux;

Architecture Beh of ALU_mux is
begin
	m0: mux16bit port map(a0 => a0_0, a1 => a0_1, a2 => a0_2, a3 => a0_3, a4 => a0_4, a4 => a0_4, a5 => a0_5, a6 => a0_6, a6 => a0_6,
								a7 => a0_7, a8 => a0_8, a9 => a0_9, a10 => a0_11, a12 => a0_12, a13 => a0_13, a14 => a0_14, a15 => a0_15, 
								s => opcode, o => a0);
	m1: mux16bit port map(a0 => a1_0, a1 => a1_1, a2 => a1_2, a3 => a1_3, a4 => a1_4, a4 => a1_4, a5 => a1_5, a6 => a1_6, a6 => a1_6,
								a7 => a1_7, a8 => a1_8, a9 => a1_9, a10 => a1_11, a12 => a1_12, a13 => a1_13, a14 => a1_14, a15 => a1_15, 
								s => opcode, o => a1);
	m2: mux16bit port map(a0 => a2_0, a1 => a2_1, a2 => a2_2, a3 => a2_3, a4 => a2_4, a4 => a2_4, a5 => a2_5, a6 => a2_6, a6 => a2_6,
								a7 => a2_7, a8 => a2_8, a9 => a2_9, a10 => a2_11, a12 => a2_12, a13 => a2_13, a14 => a2_14, a15 => a2_15, 
								s => opcode, o => a2);
	m3: mux16bit port map(a0 => a3_0, a1 => a3_1, a2 => a3_2, a3 => a3_3, a4 => a3_4, a4 => a3_4, a5 => a3_5, a6 => a3_6, a6 => a3_6,
								a7 => a3_7, a8 => a3_8, a9 => a3_9, a10 => a3_11, a12 => a3_12, a13 => a3_13, a14 => a3_14, a15 => a3_15, 
								s => opcode, o => a3);
	m4: mux16bit port map(a0 => a4_0, a1 => a4_1, a2 => a4_2, a3 => a4_3, a4 => a4_4, a4 => a4_4, a5 => a4_5, a6 => a4_6, a6 => a4_6,
								a7 => a4_7, a8 => a4_8, a9 => a4_9, a10 => a4_11, a12 => a4_12, a13 => a4_13, a14 => a4_14, a15 => a4_15, 
								s => opcode, o => a4);
	m5: mux16bit port map(a0 => a5_0, a1 => a5_1, a2 => a5_2, a3 => a5_3, a4 => a5_4, a4 => a5_4, a5 => a5_5, a6 => a5_6, a6 => a5_6,
								a7 => a5_7, a8 => a5_8, a9 => a5_9, a10 => a5_11, a12 => a5_12, a13 => a5_13, a14 => a5_14, a15 => a5_15, 
								s => opcode, o => a5);
	m6: mux16bit port map(a0 => a6_0, a1 => a6_1, a2 => a6_2, a3 => a6_3, a4 => a6_4, a4 => a6_4, a5 => a6_5, a6 => a6_6, a6 => a6_6,
								a7 => a6_7, a8 => a6_8, a9 => a6_9, a10 => a6_11, a12 => a6_12, a13 => a6_13, a14 => a6_14, a15 => a6_15, 
								s => opcode, o => a6);
	m7: mux16bit port map(a0 => y_0, a1 => y_1, a2 => y_2, a3 => y_3, a4 => y_4, a4 => y_4, a5 => y_5, a6 => y_6, a6 => y_6,
								y => y_7, a8 => y_8, a9 => y_9, a10 => y_11, a12 => y_12, a13 => y_13, a14 => y_14, a15 => y_15, 
								s => opcode, o => y);									
	m8: mux16bit port map(a0 => pc_0, a1 => pc_1, a2 => pc_2, a3 => pc_3, a4 => pc_4, a4 => pc_4, a5 => pc_5, a6 => pc_6, a6 => pc_6,
								a7 => pc_7, a8 => pc_8, a9 => pc_9, a10 => pc_11, a12 => pc_12, a13 => pc_13, a14 => pc_14, a15 => pc_15, 
								s => opcode, o => pc);
	m9: mux16bit port map(a0 => cz_0, a1 => cz_1, a2 => cz_2, a3 => cz_3, a4 => cz_4, a4 => cz_4, a5 => cz_5, a6 => cz_6, a6 => cz_6,
								a7 => cz_7, a8 => cz_8, a9 => cz_9, a10 => cz_11, a12 => cz_12, a13 => cz_13, a14 => cz_14, a15 => cz_15, 
								s => opcode, o => cz);
end Beh;