	LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package MemStageMemory is 
	COMPONENT Mmem IS
		PORT
		(
			clock: IN std_logic;
			r0,r1,r2,r3,r4,r5, r6:  IN   std_logic_vector(15 downto 0);
			ro0,ro1,ro2,ro3,ro4,ro5, ro6:  OUT  std_logic_vector(15 downto 0)
		);
	END COMPONENT;
end package MemStageMemory; 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY Mmem IS
   PORT
	(
		clock: IN std_logic;
		r0,r1,r2,r3,r4,r5, r6:  IN   std_logic_vector(15 downto 0);
		ro0,ro1,ro2,ro3,ro4,ro5, ro6:  OUT  std_logic_vector(15 downto 0)
	);
END entity Mmem;

ARCHITECTURE rtl OF Mmem IS
   TYPE mem16 IS ARRAY(0 TO 6) OF std_logic_vector(15 downto 0);
   SIGNAL reg : mem16;
BEGIN
   PROCESS (clock)
   BEGIN
		if(clock' event and clock = '1') then
			reg(0) <= r0;
			reg(1) <= r1;
			reg(2) <= r2;
			reg(3) <= r3;
			reg(4) <= r4;
			reg(5) <= r5;
			reg(6) <= r6;
		end if;
		ro0<= reg(0);
		ro1 <= reg(1);
		ro2 <= reg(2);
		ro3 <= reg(3);
		ro4 <= reg(4);
		ro5 <= reg(5);
		ro6 <= reg(6);
   END PROCESS;
END rtl;