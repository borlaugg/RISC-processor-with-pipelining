LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

package Nandpkg is
component Nand16bit IS
   PORT
   (
		a, b:  IN   std_logic_vector(15 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END component Nand16bit;
end package Nandpkg;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY Nand16bit IS
   PORT
   (
		a, b:  IN   std_logic_vector(15 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END Nand16bit;

ARCHITECTURE rtl OF Nand16bit IS
signal op: std_logic_vector(15 downto 0);
BEGIN
   op(0) <= not( a(0) and b(0));
	op(1) <= not( a(1) and b(1));
	op(2) <= not( a(2) and b(2));
	op(3) <= not( a(3) and b(3));
	op(4) <= not( a(4) and b(4));
	op(5) <= not( a(5) and b(5));
	op(6) <= not( a(6) and b(6));
	op(7) <= not( a(7) and b(7));
	op(8) <= not( a(8) and b(8));
	op(9) <= not( a(9) and b(9));
	op(10) <= not( a(10) and b(10));
	op(11) <= not( a(11) and b(11));
	op(12) <= not( a(12) and b(12));
	op(13) <= not( a(13) and b(13));
	op(14) <= not( a(14) and b(14));
	op(15) <= not( a(15) and b(15));
	z <= not (op(0) or op(1) or op(2) or op(3) or op(4) or op(5) or op(6) or op(7) or op(8) or op(9) or op(10) or op(11) or op(12) or op(13) or op(14) or op(15));
	y <= op;
	c <= '0';
END rtl;