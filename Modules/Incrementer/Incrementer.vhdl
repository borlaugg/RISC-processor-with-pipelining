LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package Incrementer is 
	COMPONENT inc IS
		PORT
		(
			pc:  IN   std_logic_vector(15 downto 0);
			bp: IN std_logic;
			data_out:     OUT  std_logic_vector(15 downto 0)
		);
	END COMPONENT;
end package Incrementer;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.FullAdder.all;
ENTITY inc IS
   PORT
   (
		pc:  IN   std_logic_vector(15 downto 0);
		bp: IN std_logic;
		data_out:     OUT  std_logic_vector(15 downto 0)
   );
END inc;

ARCHITECTURE rtl OF inc IS
signal C0,C1,C2,C3,C4,C5,C6, C7, C8, C9 ,C10, C11, C12, C13, C14, C15: std_logic;
BEGIN
   fa0: full_adder port map(A =>pc(0), B=>'1', Cin=>bp, S=>data_out(0), Cout=>C0);
	fa1: full_adder port map(A =>pc(1), B=>'0', Cin=>C0, S=>data_out(1), Cout=>C1);
	fa2: full_adder port map(A =>pc(2), B=>'0', Cin=>C1, S=>data_out(2), Cout=>C2);
	fa3: full_adder port map(A =>pc(3), B=>'0', Cin=>C2, S=>data_out(3), Cout=>C3);
	fa4: full_adder port map(A =>pc(4), B=>'0', Cin=>C3, S=>data_out(4), Cout=>C4);
	fa5: full_adder port map(A =>pc(5), B=>'0', Cin=>C4, S=>data_out(5), Cout=>C5);
	fa6: full_adder port map(A =>pc(6), B=>'0', Cin=>C5, S=>data_out(6), Cout=>C6);
	fa7: full_adder port map(A =>pc(7), B=>'0', Cin=>C6, S=>data_out(7), Cout=>C7);
	fa8: full_adder port map(A =>pc(8), B=>'0', Cin=>C7, S=>data_out(8), Cout=>C8);
	fa9: full_adder port map(A =>pc(9), B=>'0', Cin=>C8, S=>data_out(9), Cout=>C9);
	fa10: full_adder port map(A =>pc(10), B=>'0', Cin=>C9, S=>data_out(10), Cout=>C10);
	fa11: full_adder port map(A =>pc(11), B=>'0', Cin=>C10, S=>data_out(11), Cout=>C11);
	fa12: full_adder port map(A =>pc(12), B=>'0', Cin=>C11, S=>data_out(12), Cout=>C12);
	fa13: full_adder port map(A =>pc(13), B=>'0', Cin=>C12, S=>data_out(13), Cout=>C13);
	fa14: full_adder port map(A =>pc(14), B=>'0', Cin=>C13, S=>data_out(14), Cout=>C14);
	fa15: full_adder port map(A =>pc(15), B=>'0', Cin=>C14, S=>data_out(15), Cout=>C15);
END rtl;