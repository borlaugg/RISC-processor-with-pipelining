library ieee;
use ieee.std_logic_1164.all;
package IDStageMemory is
component IDMem is
	port(rf_ws,rf_rs,rf_a,rf_b : IN std_logic_vector(7 downto 0);
		  opcode : IN std_logic_vector(3 downto 0);
		  yz : IN std_logic_vector(1 downto 0);
		  imm6 : IN std_logic_vector(5 downto 0);
		  imm9 : IN std_logic_vector(8 downto 0);
		  c_we,c_re,z_re,z_we,d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
		  d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_re7,d_we7,clock: IN std_logic;
		  orf_ws,orf_rs,orf_a,orf_b : OUT std_logic_vector(7 downto 0);
		  oopcode : OUT std_logic_vector(3 downto 0);
		  oyz : OUT std_logic_vector(1 downto 0);
		  oimm6 : OUT std_logic_vector(5 downto 0);
		  oimm9 : OUT std_logic_vector(8 downto 0);
		  oc_we,oc_re,oz_re,oz_we,od_re0, od_we0,od_re1, od_we1,od_re2, od_we2,od_re3, 
		  od_we3,od_re4, od_we4,od_re5, od_we5,od_re6, od_we6,od_re7,od_we7: OUT std_logic);
end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
entity IDMem is
port(rf_ws,rf_rs,rf_a,rf_b : IN std_logic_vector(7 downto 0);
	  opcode : IN std_logic_vector(3 downto 0);
	  yz : IN std_logic_vector(1 downto 0);
	  imm6 : IN std_logic_vector(5 downto 0);
	  imm9 : IN std_logic_vector(8 downto 0);
	  c_we,c_re,z_re,z_we,d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
	  d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_re7,d_we7,clock: IN std_logic;
	  orf_ws,orf_rs,orf_a,orf_b : OUT std_logic_vector(7 downto 0);
	  oopcode : OUT std_logic_vector(3 downto 0);
	  oyz : OUT std_logic_vector(1 downto 0);
	  oimm6 : OUT std_logic_vector(5 downto 0);
	  oimm9 : OUT std_logic_vector(8 downto 0);
	  oc_we,oc_re,oz_re,oz_we,od_re0, od_we0,od_re1, od_we1,od_re2, od_we2,od_re3, 
	  od_we3,od_re4, od_we4,od_re5, od_we5,od_re6, od_we6,od_re7,od_we7: OUT std_logic);
end entity;

ARCHITECTURE rtl OF IDMem IS
   TYPE mem8 IS ARRAY(0 TO 3) OF std_logic_vector(7 downto 0);
	TYPE mem4 IS ARRAY(0 TO 0) OF std_logic_vector(3 downto 0);
   TYPE mem2 IS ARRAY(0 TO 0) OF std_logic_vector(1 downto 0);
	TYPE mem6 IS ARRAY(0 TO 0) OF std_logic_vector(5 downto 0);
	TYPE mem9 IS ARRAY(0 TO 0) OF std_logic_vector(8 downto 0);
	TYPE mem1 IS ARRAY(0 TO 19) OF std_logic;
   SIGNAL reg : mem1;
   SIGNAL reg9 : mem9;
   SIGNAL reg6 : mem6;
   SIGNAL reg2 : mem2;
	SIGNAL reg8 : mem8;
	SIGNAL reg4 : mem4;
BEGIN
   PROCESS (clock)
   BEGIN
		if(clock' event and clock = '1') then
			reg8(0) <= rf_ws;
			reg8(1) <= rf_rs;
			reg8(2) <= rf_a;
			reg8(3) <= rf_b;
			reg4(0) <= opcode;
			reg2(0) <= yz;
			reg6(0) <= imm6;
			reg9(0) <= imm9;
			reg(0) <= c_we;
			reg(1) <= c_re;
			reg(2) <= z_re;
			reg(3) <= z_we;
			reg(4) <= d_re0;  
			reg(5) <=  d_we0;
			reg(6) <= d_re1;
			reg(7) <= d_we1;
			reg(8) <= d_re2;
			reg(9) <= d_we2;
			reg(10) <= d_re3;
			reg(11) <= d_we3;
			reg(12) <= d_re4;
			reg(13) <= d_we4;
			reg(14) <= d_re5;
			reg(15) <= d_we5;
			reg(16) <= d_re6;
			reg(17) <= d_we6;
			reg(18) <= d_re7;
			reg(19) <= d_we7;
			
		end if;
		orf_ws <= reg8(0);
		orf_rs <= reg8(1);
		orf_a <= reg8(2);
		orf_b <= reg8(3);
		oopcode <= reg4(0);
		oyz <= reg2(0);
		oimm6 <= reg6(0);
		oimm9 <= reg9(0);
		oc_we <= reg(0);
		oc_re <= reg(1);
		oz_re<= reg(2);
		oz_we <= reg(3);
		od_re0 <= reg(4);
		od_we0 <= reg(5);
		od_re1 <= reg(6);
		od_we1 <= reg(7);
		od_re2 <= reg(8);
		od_we2 <= reg(9);
		od_re3 <= reg(10);
		od_we3 <= reg(11);
		od_re4 <= reg(12);
		od_we4 <= reg(13);
		od_re5 <= reg(14);
		od_we5 <= reg(15);
		od_re6 <= reg(16);
		od_we6 <= reg(17);
		od_re7 <= reg(18);
		od_we7 <= reg(19);
   END PROCESS;
END rtl;