LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package ExecStageMemory is 
	COMPONENT Emem IS
		PORT
		(
			clock: IN std_logic;
			pc_in, a0,a1,a2,a3,a4,a5,a6,y,r0,r1,r2,r3,r4,r5, r6:  IN   std_logic_vector(15 downto 0);
			pc_out, ao0,ao1,ao2,ao3,ao4,ao5,ao6,yo,ro0,ro1,ro2,ro3,ro4,ro5, ro6:  OUT  std_logic_vector(15 downto 0)
		);
	END COMPONENT;
end package ExecStageMemory; 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY Emem IS
   PORT
   (
		clock: IN std_logic;
		pc_in, a0,a1,a2,a3,a4,a5,a6,y,r0,r1,r2,r3,r4,r5,r6:  IN   std_logic_vector(15 downto 0);
		pc_out, ao0,ao1,ao2,ao3,ao4,ao5,ao6,yo,ro0,ro1,ro2,ro3,ro4,ro5,ro6:  OUT  std_logic_vector(15 downto 0)
   );
END entity Emem;

ARCHITECTURE rtl OF Emem IS
   TYPE mem IS ARRAY(0 TO 15) OF std_logic_vector(15 downto 0);
   SIGNAL reg : mem;
BEGIN
   PROCESS (clock)
   BEGIN
		if(clock' event and clock = '1') then
			reg(0) <= pc_in;
			reg(1) <= a0;
			reg(2) <= a1;
			reg(3) <= a2;
			reg(4) <= a3;
			reg(5) <= a4;
			reg(6) <= a5;
			reg(7) <= a6;
			reg(8) <= y;
			reg(9) <= r0;
			reg(10) <= r1;
			reg(11) <= r2;
			reg(12) <= r3;
			reg(13) <= r4;
			reg(14) <= r5;
			reg(15) <= r6;
		end if;
		pc_out <= reg(0);
		ao0 <= reg(1);
		ao1 <= reg(2);
		ao2 <= reg(3);
		ao3 <= reg(4);
		ao4 <= reg(5);
		ao5 <= reg(6);
		ao6 <= reg(7);
		yo <= reg(8);
		ro0<= reg(9);
		ro1 <= reg(10);
		ro2 <= reg(11);
		ro3 <= reg(12);
		ro4 <= reg(13);
		ro5 <= reg(14);
		ro6 <= reg(15);
   END PROCESS;
END rtl;