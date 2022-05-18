LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package ExecStageMemory is 
	COMPONENT Emem IS
		PORT
		(
			d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
			d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_re7,d_we7,clock: IN std_logic;
			rf_ws : IN std_logic_vector(7 downto 0);
			pc_in, a0,a1,a2,a3,a4,a5,a6,a7,y,r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
			pc_out, ao0,ao1,ao2,ao3,ao4,ao5,ao6,ao7,yo,ro0,ro1,ro2,ro3,ro4,ro5, ro6,ro7:  OUT  std_logic_vector(15 downto 0);
			orf_ws : OUT std_logic_vector(7 downto 0);
			od_re0, od_we0,od_re1, od_we1,od_re2, od_we2,od_re3, 
			od_we3,od_re4, od_we4,od_re5, od_we5,od_re6, od_we6,od_re7,od_we7: OUT std_logic
		);
	END COMPONENT;
end package ExecStageMemory; 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY Emem IS
   PORT
   (
		d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
		d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_re7,d_we7,clock: IN std_logic;
		rf_ws : IN std_logic_vector(7 downto 0);
		pc_in, a0,a1,a2,a3,a4,a5,a6,a7,y,r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
		pc_out, ao0,ao1,ao2,ao3,ao4,ao5,ao6,ao7,yo,ro0,ro1,ro2,ro3,ro4,ro5, ro6,ro7:  OUT  std_logic_vector(15 downto 0);
		orf_ws : OUT std_logic_vector(7 downto 0);
		od_re0, od_we0,od_re1, od_we1,od_re2, od_we2,od_re3, 
		od_we3,od_re4, od_we4,od_re5, od_we5,od_re6, od_we6,od_re7,od_we7: OUT std_logic
   );
END entity Emem;

ARCHITECTURE rtl OF Emem IS
   TYPE mem IS ARRAY(0 TO 17) OF std_logic_vector(15 downto 0);
	TYPE mem8 IS ARRAY(0 TO 0) OF std_logic_vector(7 downto 0);
	TYPE mem1 IS ARRAY(0 TO 15) OF std_logic;
   SIGNAL reg : mem;
	SIGNAL reg1 : mem1;
	SIGNAL reg8 : mem8;
BEGIN
   PROCESS (clock)
   BEGIN
		if(clock' event and clock = '1') then
			reg8(0) <= rf_ws;
			reg(0) <= pc_in;
			reg(1) <= a0;
			reg(2) <= a1;
			reg(3) <= a2;
			reg(4) <= a3;
			reg(5) <= a4;
			reg(6) <= a5;
			reg(7) <= a6;
			reg(8) <= a7;
			reg(9) <= y;
			reg(10) <= r0;
			reg(11) <= r1;
			reg(12) <= r2;
			reg(13) <= r3;
			reg(14) <= r4;
			reg(15) <= r5;
			reg(16) <= r6;
			reg(17) <= r7;
			reg1(0) <= d_re0;  
			reg1(1) <=  d_we0;
			reg1(2) <= d_re1;
			reg1(3) <= d_we1;
			reg1(4) <= d_re2;
			reg1(5) <= d_we2;
			reg1(6) <= d_re3;
			reg1(7) <= d_we3;
			reg1(8) <= d_re4;
			reg1(9) <= d_we4;
			reg1(10) <= d_re5;
			reg1(11) <= d_we5;
			reg1(12) <= d_re6;
			reg1(13) <= d_we6;
			reg1(14) <= d_re7;
			reg1(15) <= d_we7;
		end if;
		orf_ws <= reg8(0);
		pc_out <= reg(0);
		ao0 <= reg(1);
		ao1 <= reg(2);
		ao2 <= reg(3);
		ao3 <= reg(4);
		ao4 <= reg(5);
		ao5 <= reg(6);
		ao6 <= reg(7);
		ao7 <= reg(8);
		yo <= reg(9);
		ro0<= reg(10);
		ro1 <= reg(11);
		ro2 <= reg(12);
		ro3 <= reg(13);
		ro4 <= reg(14);
		ro5 <= reg(15);
		ro6 <= reg(16);
		ro7 <= reg(17);
		od_re0 <= reg1(0);
		od_we0 <= reg1(1);
		od_re1 <= reg1(2);
		od_we1 <= reg1(3);
		od_re2 <= reg1(4);
		od_we2 <= reg1(5);
		od_re3 <= reg1(6);
		od_we3 <= reg1(7);
		od_re4 <= reg1(8);
		od_we4 <= reg1(9);
		od_re5 <= reg1(10);
		od_we5 <= reg1(11);
		od_re6 <= reg1(12);
		od_we6 <= reg1(13);
		od_re7 <= reg1(14);
		od_we7 <= reg1(15);
   END PROCESS;
END rtl;