LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

package MultipleAddress is
component MultipleAdd IS
   PORT
   (
		a:  IN   std_logic_vector(15 downto 0);
		c,z: OUT std_logic;
		a0,a1,a2,a3,a4,a5,a6:     OUT  std_logic_vector(15 downto 0)
   );
END component MultipleAdd;
end package MultipleAddress;


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.adder.all;
ENTITY MultipleAdd IS
   PORT
   (
		a:  IN   std_logic_vector(15 downto 0);
		c,z: OUT std_logic;
		a0,a1,a2,a3,a4,a5,a6:     OUT  std_logic_vector(15 downto 0)
   );
END MultipleAdd;

ARCHITECTURE rtl OF MultipleAdd IS
BEGIN
   add0: adder port map(a => a, b => "0000000000000000", c => c0, z=>z0, y => a0); 
	add1: adder port map(a => a, b => "0000000000000001", c => c0, z=>z0, y => a1); 
	add2: adder port map(a => a, b => "0000000000000010", c => c0, z=>z0, y => a2);
	add3: adder port map(a => a, b => "0000000000000011", c => c0, z=>z0, y => a3);
	add4: adder port map(a => a, b => "0000000000000100", c => c0, z=>z0, y => a4);
	add5: adder port map(a => a, b => "0000000000000101", c => c0, z=>z0, y => a5);
	add6: adder port map(a => a, b => "0000000000000110", c => c0, z=>z0, y => a6);
END rtl;