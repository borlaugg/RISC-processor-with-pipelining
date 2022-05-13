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
BEGIN
   y(15 downto 8) <= a;
	y(7 downto 0) <= "00000000";
	z <= not ((0) or y(1) or y(2) or y(3) or y(4) or y(5) or y(6) or y(7) or y(8) or y(9) or y(10) or y(11) or y(12) or y(13) or y(14) or y(15));
END rtl;