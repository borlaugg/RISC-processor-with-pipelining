LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package RRStageMemory is 
	COMPONENT Rmem IS
		PORT
		(
			clock: IN std_logic;
			a,b,pc_in, a0,a1,a2,a3,a4,a5,a6,a7,y,r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
			imm6:  IN   std_logic_vector(5 downto 0);
			imm9:  IN   std_logic_vector(8 downto 0);
			yz:  IN   std_logic_vector(1 downto 0);
			op:  IN   std_logic_vector(3 downto 0);
			ao,bo,pc_out, ao0,ao1,ao2,ao3,ao4,ao5,ao6,ao7,yo,ro0,ro1,ro2,ro3,ro4,ro5, ro6,ro7:  OUT  std_logic_vector(15 downto 0);
			imm6o:  OUT   std_logic_vector(5 downto 0);
			imm9o:  OUT   std_logic_vector(8 downto 0);
			yzo:  OUT   std_logic_vector(1 downto 0);
			opo:  OUT   std_logic_vector(3 downto 0)
		);
	END COMPONENT;
end package RRStageMemory; 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY Rmem IS
   PORT
   (
		clock: IN std_logic;
		a,b,pc_in, a0,a1,a2,a3,a4,a5,a6,a7,y,r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
		imm6:  IN   std_logic_vector(5 downto 0);
		imm9:  IN   std_logic_vector(8 downto 0);
		yz:  IN   std_logic_vector(1 downto 0);
		op:  IN   std_logic_vector(3 downto 0);
		ao,bo,pc_out, ao0,ao1,ao2,ao3,ao4,ao5,ao6,ao7,yo,ro0,ro1,ro2,ro3,ro4,ro5, ro6,ro7:  OUT  std_logic_vector(15 downto 0);
		imm6o:  OUT   std_logic_vector(5 downto 0);
		imm9o:  OUT   std_logic_vector(8 downto 0);
		yzo:  OUT   std_logic_vector(1 downto 0);
		opo:  OUT   std_logic_vector(3 downto 0)
   );
END entity Rmem;

ARCHITECTURE rtl OF Rmem IS
   TYPE mem16 IS ARRAY(0 TO 19) OF std_logic_vector(15 downto 0);
	TYPE mem2 IS ARRAY(0 TO 0) OF std_logic_vector(1 downto 0);
	TYPE mem9 IS ARRAY(0 TO 0) OF std_logic_vector(8 downto 0);
	TYPE mem6 IS ARRAY(0 TO 0) OF std_logic_vector(5 downto 0);
	TYPE mem4 IS ARRAY(0 TO 0) OF std_logic_vector(3 downto 0);
   SIGNAL reg : mem16;
	SIGNAL reg2 : mem2;
	SIGNAL reg4 : mem4;
	SIGNAL reg6 : mem6;
	SIGNAL reg9 : mem9;
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
			reg(18) <= a;
			reg(19) <= b;
			reg2(0) <= yz;
			reg4(0) <= op;
			reg6(0) <= imm6;
			reg9(0) <= imm9;
		end if;
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
		ao <= reg(18);
		bo <= reg(19);
		yzo <= reg2(0);
		opo <= reg4(0);
		imm6o <= reg6(0);
		imm9o <= reg9(0);
   END PROCESS;
END rtl;