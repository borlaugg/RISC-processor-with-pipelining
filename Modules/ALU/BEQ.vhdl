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
	signal sel,dummmy_c, dummmy_z: std_logic;
	signal result: std_logic_vector(15 downto 0);
	signal op: std_logic_vector(15 downto 0);
BEGIN
   op(0) <= ( a(0) xor b(0));
	op(1) <= ( a(1) xor b(1));
	op(2) <= ( a(2) xor b(2));
	op(3) <= ( a(3) xor b(3));
	op(4) <= ( a(4) xor b(4));
	op(5) <= ( a(5) xor b(5));
	op(6) <= ( a(6) xor b(6));
	op(7) <= ( a(7) xor b(7));
	op(8) <= ( a(8) xor b(8));
	op(9) <= ( a(9) xor b(9));
	op(10) <= ( a(10) xor b(10));
	op(11) <= ( a(11) xor b(11));
	op(12) <= ( a(12) xor b(12));
	op(13) <= ( a(13) xor b(13));
	op(14) <= ( a(14) xor b(14));
	op(15) <= ( a(15) xor b(15));
	sel <= not (op(0) or op(1) or op(2) or op(3) or op(4) or op(5) or op(6) or op(7) or op(8) or op(9) or op(10) or op(11) or op(12) or op(13) or op(14) or op(15));
	z <= sel;
	c<= '0';
	add:  LW_SW port map(a => pc, imm=> imm, c=> dummmy_c, z=> dummmy_z, y=> result);
	mx:  mux port map(a =>pc, b=>result, s=>sel, y=>y);
END rtl;