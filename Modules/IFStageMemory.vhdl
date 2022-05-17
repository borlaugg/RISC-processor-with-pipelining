LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package IFStageMemory is 
	COMPONENT IFmem IS
		PORT
		(
			pc_re, ir_re: IN std_logic;
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
		pc_re, ir_re: IN std_logic;
		pc_in, ir:  IN   std_logic_vector(15 downto 0);
		pc_out, iro:  OUT  std_logic_vector(15 downto 0)
   );
END entity IFmem;

ARCHITECTURE rtl OF IFmem IS
   TYPE mem16 IS ARRAY(0 TO 17) OF std_logic_vector(15 downto 0);
   SIGNAL reg : mem16;
BEGIN
   PROCESS (clock)
   BEGIN
		if (pc_re= '1') then
			reg(0) <= pc_in;
		end if;
		if(ir_re = '1') then
			reg(1) <= ir;
		end if;
		pc_out <= reg(0);
		iro <= reg(1);
   END PROCESS;
END rtl;