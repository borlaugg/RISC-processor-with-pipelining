LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package RRStageMemory is 
	COMPONENT Rmem IS
		PORT
		(
			c_we,c_re,z_re,z_we,d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
			d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_re7,d_we7,clock: IN std_logic;
			rf_rs,rf_ws,rf_a,rf_b : IN std_logic_vector(7 downto 0);
			pc_in,r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
			imm6:  IN   std_logic_vector(5 downto 0);
			imm9:  IN   std_logic_vector(8 downto 0);
			yz:  IN   std_logic_vector(1 downto 0);
			op:  IN   std_logic_vector(3 downto 0);
			orf_rs,orf_ws,orf_a,orf_b : OUT std_logic_vector(7 downto 0);
			pc_out,ro0,ro1,ro2,ro3,ro4,ro5, ro6,ro7:  OUT  std_logic_vector(15 downto 0);
			imm6o:  OUT   std_logic_vector(5 downto 0);
			imm9o:  OUT   std_logic_vector(8 downto 0);
			yzo:  OUT   std_logic_vector(1 downto 0);
			opo:  OUT   std_logic_vector(3 downto 0);
			oc_we,oc_re,oz_re,oz_we,od_re0, od_we0,od_re1, od_we1,od_re2, od_we2,od_re3, 
		   od_we3,od_re4, od_we4,od_re5, od_we5,od_re6, od_we6,od_re7,od_we7: OUT std_logic
		);
	END COMPONENT;
end package RRStageMemory; 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY Rmem IS
   PORT
   (
		c_we,c_re,z_re,z_we,d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
		d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_re7,d_we7,clock: IN std_logic;
		rf_rs,rf_ws,rf_a,rf_b : IN std_logic_vector(7 downto 0);
		pc_in,r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
		imm6:  IN   std_logic_vector(5 downto 0);
		imm9:  IN   std_logic_vector(8 downto 0);
		yz:  IN   std_logic_vector(1 downto 0);
		op:  IN   std_logic_vector(3 downto 0);
		orf_rs,orf_ws,orf_a,orf_b : OUT std_logic_vector(7 downto 0);
		pc_out,ro0,ro1,ro2,ro3,ro4,ro5, ro6,ro7:  OUT  std_logic_vector(15 downto 0);
		imm6o:  OUT   std_logic_vector(5 downto 0);
		imm9o:  OUT   std_logic_vector(8 downto 0);
		yzo:  OUT   std_logic_vector(1 downto 0);
		opo:  OUT   std_logic_vector(3 downto 0);
		oc_we,oc_re,oz_re,oz_we,od_re0, od_we0,od_re1, od_we1,od_re2, od_we2,od_re3, 
		od_we3,od_re4, od_we4,od_re5, od_we5,od_re6, od_we6,od_re7,od_we7: OUT std_logic
   );
END entity Rmem;

ARCHITECTURE rtl OF Rmem IS
   TYPE mem16 IS ARRAY(0 TO 8) OF std_logic_vector(15 downto 0);
	TYPE mem2 IS ARRAY(0 TO 0) OF std_logic_vector(1 downto 0);
	TYPE mem9 IS ARRAY(0 TO 0) OF std_logic_vector(8 downto 0);
	TYPE mem6 IS ARRAY(0 TO 0) OF std_logic_vector(5 downto 0);
	TYPE mem4 IS ARRAY(0 TO 0) OF std_logic_vector(3 downto 0);
	TYPE mem8 IS ARRAY(0 TO 3) OF std_logic_vector(7 downto 0);
	TYPE mem1 IS ARRAY(0 TO 19) OF std_logic;
   SIGNAL reg : mem16;
	SIGNAL reg1 : mem1;
	SIGNAL reg2 : mem2;
	SIGNAL reg4 : mem4;
	SIGNAL reg6 : mem6;
	SIGNAL reg8 : mem8;
	SIGNAL reg9 : mem9;
BEGIN
   PROCESS (clock)
   BEGIN
		if(clock' event and clock = '1') then
			reg8(0) <= rf_ws;
			reg8(1) <= rf_rs;
			reg8(2) <= rf_a;
			reg8(3) <= rf_b;
			reg(0) <= pc_in;
			reg(1) <= r0;
			reg(2) <= r1;
			reg(3) <= r2;
			reg(4) <= r3;
			reg(5) <= r4;
			reg(6) <= r5;
			reg(7) <= r6;
			reg(8) <= r7;
			reg2(0) <= yz;
			reg4(0) <= op;
			reg6(0) <= imm6;
			reg9(0) <= imm9;
			reg1(0) <= c_we;
			reg1(1) <= c_re;
			reg1(2) <= z_re;
			reg1(3) <= z_we;
			reg1(4) <= d_re0;  
			reg1(5) <=  d_we0;
			reg1(6) <= d_re1;
			reg1(7) <= d_we1;
			reg1(8) <= d_re2;
			reg1(9) <= d_we2;
			reg1(10) <= d_re3;
			reg1(11) <= d_we3;
			reg1(12) <= d_re4;
			reg1(13) <= d_we4;
			reg1(14) <= d_re5;
			reg1(15) <= d_we5;
			reg1(16) <= d_re6;
			reg1(17) <= d_we6;
			reg1(18) <= d_re7;
			reg1(19) <= d_we7;
		end if;
		orf_ws <= reg8(0);
		orf_rs <= reg8(1);
		orf_a <= reg8(2);
		orf_b <= reg8(3);
		pc_out <= reg(0);
		ro0<= reg(1);
		ro1 <= reg(2);
		ro2 <= reg(3);
		ro3 <= reg(4);
		ro4 <= reg(5);
		ro5 <= reg(6);
		ro6 <= reg(7);
		ro7 <= reg(8);
		yzo <= reg2(0);
		opo <= reg4(0);
		imm6o <= reg6(0);
		imm9o <= reg9(0);
		oc_we <= reg1(0);
		oc_re <= reg1(1);
		oz_re<= reg1(2);
		oz_we <= reg1(3);
		od_re0 <= reg1(4);
		od_we0 <= reg1(5);
		od_re1 <= reg1(6);
		od_we1 <= reg1(7);
		od_re2 <= reg1(8);
		od_we2 <= reg1(9);
		od_re3 <= reg1(10);
		od_we3 <= reg1(11);
		od_re4 <= reg1(12);
		od_we4 <= reg1(13);
		od_re5 <= reg1(14);
		od_we5 <= reg1(15);
		od_re6 <= reg1(16);
		od_we6 <= reg1(17);
		od_re7 <= reg1(18);
		od_we7 <= reg1(19);
   END PROCESS;
END rtl;