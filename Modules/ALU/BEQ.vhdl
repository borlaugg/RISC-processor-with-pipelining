LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

package Beqpkg is
component BEQ IS
   PORT
   (
		pc, a, b:  IN   std_logic_vector(15 downto 0);
		imm: IN std_logic_vector(5 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END component BEQ;
end package beqpkg;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.LWSWpkg.all;
use work.mux2x1_16bit.all;
ENTITY BEQ IS
   PORT
   (
		pc, a, b:  IN   std_logic_vector(15 downto 0);
		imm: IN std_logic_vector(5 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END BEQ;

ARCHITECTURE rtl OF BEQ IS
	signal sel: std_logic;
	signal result: std_logic_vector(15 downto 0);
BEGIN
   y(0) <= ( a(0) xor b(0));
	y(1) <= ( a(1) xor b(1));
	y(2) <= ( a(2) xor b(2));
	y(3) <= ( a(3) xor b(3));
	y(4) <= ( a(4) xor b(4));
	y(5) <= ( a(5) xor b(5));
	y(6) <= ( a(6) xor b(6));
	y(7) <= ( a(7) xor b(7));
	y(8) <= ( a(8) xor b(8));
	y(9) <= ( a(9) xor b(9));
	y(10) <= ( a(10) xor b(10));
	y(11) <= ( a(11) xor b(11));
	y(12) <= ( a(12) xor b(12));
	y(13) <= ( a(13) xor b(13));
	y(14) <= ( a(14) xor b(14));
	y(15) <= ( a(15) xor b(15));
	sel <= not ((0) or y(1) or y(2) or y(3) or y(4) or y(5) or y(6) or y(7) or y(8) or y(9) or y(10) or y(11) or y(12) or y(13) or y(14) or y(15));
	add:  LW_SW port map(a => pc, imm=> imm, c=> c, z=> z, y=> result);
	mux:  mux port map(a =>pc, b=>result, s=>sel, y=>y);
END rtl;