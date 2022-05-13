LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

package ADLpkg is
component ADL IS
   PORT
   (
		a, b:  IN   std_logic_vector(15 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END component ADL;

end package ADLpkg;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.FullAdder.all;
ENTITY ADL IS
   PORT
   (
		a, b:  IN   std_logic_vector(15 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END ADL;

ARCHITECTURE rtl OF ADL IS
signal C0,C1,C2,C3,C4,C5,C6, C7, C8, C9 ,C10, C11, C12, C13, C14: std_logic;
BEGIN
   fa0: full_adder port map(A =>a(0), B=>'0', Cin=>'0', S=>y(0), Cout=>C0);
	fa1: full_adder port map(A =>a(1), B=>b(0), Cin=>C0, S=>y(1), Cout=>C1);
	fa2: full_adder port map(A =>a(2), B=>b(1), Cin=>C1, S=>y(2), Cout=>C2);
	fa3: full_adder port map(A =>a(3), B=>b(2), Cin=>C2, S=>y(3), Cout=>C3);
	fa4: full_adder port map(A =>a(4), B=>b(3), Cin=>C3, S=>y(4), Cout=>C4);
	fa5: full_adder port map(A =>a(5), B=>b(4), Cin=>C4, S=>y(5), Cout=>C5);
	fa6: full_adder port map(A =>a(6), B=>b(5), Cin=>C5, S=>y(6), Cout=>C6);
	fa7: full_adder port map(A =>a(7), B=>b(6), Cin=>C6, S=>y(7), Cout=>C7);
	fa8: full_adder port map(A =>a(8), B=>b(7), Cin=>C7, S=>y(8), Cout=>C8);
	fa9: full_adder port map(A =>a(9), B=>b(8), Cin=>C8, S=>y(9), Cout=>C9);
	fa10: full_adder port map(A =>a(10), B=>b(9), Cin=>C9, S=>y(10), Cout=>C10);
	fa11: full_adder port map(A =>a(11), B=>b(10), Cin=>C10, S=>y(11), Cout=>C11);
	fa12: full_adder port map(A =>a(12), B=>b(11), Cin=>C11, S=>y(12), Cout=>C12);
	fa13: full_adder port map(A =>a(13), B=>b(12), Cin=>C12, S=>y(13), Cout=>C13);
	fa14: full_adder port map(A =>a(14), B=>b(13), Cin=>C13, S=>y(14), Cout=>C14);
	fa15: full_adder port map(A =>a(15), B=>b(14), Cin=>C14, S=>y(15), Cout=>c);
	z <= not ((0) or y(1) or y(2) or y(3) or y(4) or y(5) or y(6) or y(7) or y(8) or y(9) or y(10) or y(11) or y(12) or y(13) or y(14) or y(15));
END rtl;