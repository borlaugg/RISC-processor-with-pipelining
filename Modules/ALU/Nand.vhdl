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
BEGIN
   y(0) <= not( a(0) and b(0));
	y(1) <= not( a(1) and b(1));
	y(2) <= not( a(2) and b(2));
	y(3) <= not( a(3) and b(3));
	y(4) <= not( a(4) and b(4));
	y(5) <= not( a(5) and b(5));
	y(6) <= not( a(6) and b(6));
	y(7) <= not( a(7) and b(7));
	y(8) <= not( a(8) and b(8));
	y(9) <= not( a(9) and b(9));
	y(10) <= not( a(10) and b(10));
	y(11) <= not( a(11) and b(11));
	y(12) <= not( a(12) and b(12));
	y(13) <= not( a(13) and b(13));
	y(14) <= not( a(14) and b(14));
	y(15) <= not( a(15) and b(15));
	z <= not ((0) or y(1) or y(2) or y(3) or y(4) or y(5) or y(6) or y(7) or y(8) or y(9) or y(10) or y(11) or y(12) or y(13) or y(14) or y(15));
	c <= '0';
END rtl;