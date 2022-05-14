LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package LHIpkg is
	component LHI IS
	PORT
	(
		a:  IN   std_logic_vector(8 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
	);
	END component LHI;
end package;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
library work;
use work.FullAdder.all;
ENTITY LHI IS
   PORT
   (
		a:  IN   std_logic_vector(8 downto 0);
		c,z: OUT std_logic;
		y:     OUT  std_logic_vector(15 downto 0)
   );
END LHI;

ARCHITECTURE rtl OF LHI IS
signal op: std_logic_vector(15 downto 0);
BEGIN
   op(15 downto 7) <= a;
	op(6 downto 0) <= "0000000";
	z <= not (op(0) or op(1) or op(2) or op(3) or op(4) or op(5) or op(6) or op(7) or op(8) or op(9) or op(10) or op(11) or op(12) or op(13) or op(14) or op(15));
	y <= op;
END rtl;