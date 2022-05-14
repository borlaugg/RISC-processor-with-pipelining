LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package LWSWpkg is
	component LW_SW IS
	PORT
	(
		a:  IN   std_logic_vector(15 downto 0);
		imm:  IN   std_logic_vector(5 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
	);
	END component LW_SW;
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.FullAdder.all;
ENTITY LW_SW IS
   PORT
   (
		a:  IN   std_logic_vector(15 downto 0);
		imm:  IN   std_logic_vector(5 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END LW_SW;

ARCHITECTURE rtl OF LW_SW IS
signal C0,C1,C2,C3,C4,C5,C6, C7, C8, C9 ,C10, C11, C12, C13, C14: std_logic;
signal op: std_logic_vector(15 downto 0);
BEGIN
   fa0: full_adder port map(A =>a(0), B=>imm(0), Cin=>'0', S=>op(0), Cout=>C0);
	fa1: full_adder port map(A =>a(1), B=>imm(1), Cin=>C0, S=>op(1), Cout=>C1);
	fa2: full_adder port map(A =>a(2), B=>imm(2), Cin=>C1, S=>op(2), Cout=>C2);
	fa3: full_adder port map(A =>a(3), B=>imm(3), Cin=>C2, S=>op(3), Cout=>C3);
	fa4: full_adder port map(A =>a(4), B=>imm(4), Cin=>C3, S=>op(4), Cout=>C4);
	fa5: full_adder port map(A =>a(5), B=>imm(5), Cin=>C4, S=>op(5), Cout=>C5);
	fa6: full_adder port map(A =>a(6), B=>'0', Cin=>C5, S=>op(6), Cout=>C6);
	fa7: full_adder port map(A =>a(7), B=>'0', Cin=>C6, S=>op(7), Cout=>C7);
	fa8: full_adder port map(A =>a(8), B=>'0', Cin=>C7, S=>op(8), Cout=>C8);
	fa9: full_adder port map(A =>a(9), B=>'0', Cin=>C8, S=>op(9), Cout=>C9);
	fa10: full_adder port map(A =>a(10), B=>'0', Cin=>C9, S=>op(10), Cout=>C10);
	fa11: full_adder port map(A =>a(11), B=>'0', Cin=>C10, S=>op(11), Cout=>C11);
	fa12: full_adder port map(A =>a(12), B=>'0', Cin=>C11, S=>op(12), Cout=>C12);
	fa13: full_adder port map(A =>a(13), B=>'0', Cin=>C12, S=>op(13), Cout=>C13);
	fa14: full_adder port map(A =>a(14), B=>'0', Cin=>C13, S=>op(14), Cout=>C14);
	fa15: full_adder port map(A =>a(15), B=>'0', Cin=>C14, S=>op(15), Cout=>c);
	z <= not (op(0) or op(1) or op(2) or op(3) or op(4) or op(5) or op(6) or op(7) or op(8) or op(9) or op(10) or op(11) or op(12) or op(13) or op(14) or op(15));
	y <= op;
END rtl;