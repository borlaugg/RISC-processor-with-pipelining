LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package IFStageMemory is 
	COMPONENT IFmem IS
		PORT
		(
			clock: IN std_logic;
			pc_in, ir:  IN   std_logic_vector(15 downto 0);
			pc_out, iro:  OUT  std_logic_vector(15 downto 0)
		);
	END COMPONENT;
end package IFStageMemory; 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY IFmem IS
   PORT
   (
		clock: IN std_logic;
		pc_in, ir:  IN   std_logic_vector(15 downto 0);
		pc_out, iro:  OUT  std_logic_vector(15 downto 0)
   );
END entity IFmem;

ARCHITECTURE rtl OF IFmem IS
   TYPE mem16 IS ARRAY(0 TO 1) OF std_logic_vector(15 downto 0);
   SIGNAL reg : mem16;
BEGIN
   PROCESS (clock)
   BEGIN
		if (clock'event and clock='1') then
			reg(0) <= pc_in;
			reg(1) <= ir;
		end if;
		pc_out <= reg(0);
		iro <= reg(1);
   END PROCESS;
END rtl;