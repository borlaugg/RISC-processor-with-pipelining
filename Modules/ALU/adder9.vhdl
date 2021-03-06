LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package adder9pkg is
	component adder9 IS
	PORT
	(
		a:  IN   std_logic_vector(15 downto 0);
		imm : IN   std_logic_vector(8 downto 0);
		y:     OUT  std_logic_vector(15 downto 0)
	);
	END component adder9;
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.FullAdder.all;
ENTITY adder9 IS
   PORT
   (
		a:  IN   std_logic_vector(15 downto 0);
		imm : IN   std_logic_vector(8 downto 0);
		y:     OUT  std_logic_vector(15 downto 0)
   );
END entity adder9;

ARCHITECTURE rtl OF adder9 IS
signal C0,C1,C2,C3,C4,C5,C6, C7, C8, C9 ,C10, C11, C12, C13, C14,C15: std_logic;
BEGIN
   fa0: full_adder port map(A =>a(0), B=>imm(0), Cin=>'0', S=>y(0), Cout=>C0);
	fa1: full_adder port map(A =>a(1), B=>imm(1), Cin=>C0, S=>y(1), Cout=>C1);
	fa2: full_adder port map(A =>a(2), B=>imm(2), Cin=>C1, S=>y(2), Cout=>C2);
	fa3: full_adder port map(A =>a(3), B=>imm(3), Cin=>C2, S=>y(3), Cout=>C3);
	fa4: full_adder port map(A =>a(4), B=>imm(4), Cin=>C3, S=>y(4), Cout=>C4);
	fa5: full_adder port map(A =>a(5), B=>imm(5), Cin=>C4, S=>y(5), Cout=>C5);
	fa6: full_adder port map(A =>a(6), B=>imm(6), Cin=>C5, S=>y(6), Cout=>C6);
	fa7: full_adder port map(A =>a(7), B=>imm(7), Cin=>C6, S=>y(7), Cout=>C7);
	fa8: full_adder port map(A =>a(8), B=>imm(8), Cin=>C7, S=>y(8), Cout=>C8);
	fa9: full_adder port map(A =>a(9), B=>'0', Cin=>C8, S=>y(9), Cout=>C9);
	fa10: full_adder port map(A =>a(10), B=>'0', Cin=>C9, S=>y(10), Cout=>C10);
	fa11: full_adder port map(A =>a(11), B=>'0', Cin=>C10, S=>y(11), Cout=>C11);
	fa12: full_adder port map(A =>a(12), B=>'0', Cin=>C11, S=>y(12), Cout=>C12);
	fa13: full_adder port map(A =>a(13), B=>'0', Cin=>C12, S=>y(13), Cout=>C13);
	fa14: full_adder port map(A =>a(14), B=>'0', Cin=>C13, S=>y(14), Cout=>C14);
	fa15: full_adder port map(A =>a(15), B=>'0', Cin=>C14, S=>y(15), Cout=>C15);
END rtl;