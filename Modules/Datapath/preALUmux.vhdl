library ieee;
use ieee.std_logic_1164.all;
package preALUmuxpkg is
	component preALUmux is
		port (r0,r1,r2,r3,r4,r5,r6,r7 : IN std_logic_vector(15 downto 0);
				rfa : IN std_logic_vector(7 downto 0);
				a :OUT std_logic_vector(15 downto 0));
	end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
entity preALUmux is
	port (r0,r1,r2,r3,r4,r5,r6,r7 : IN std_logic_vector(15 downto 0);
			rfa : IN std_logic_vector(7 downto 0);
			a :OUT std_logic_vector(15 downto 0));
end entity;

architecture beh of preALUmux is
begin
	a(0) <= (rfa(0) and r0(0)) or (rfa(1) and r1(0)) or (rfa(2) and r2(0)) or (rfa(3) and r3(0)) or 
				(rfa(4) and r4(0)) or (rfa(5) and r5(0)) or (rfa(6) and r6(0)) or (rfa(7) and r7(0));
	a(1) <= (rfa(0) and r0(1)) or (rfa(1) and r1(1)) or (rfa(2) and r2(1)) or (rfa(3) and r3(1)) or 
				(rfa(4) and r4(1)) or (rfa(5) and r5(1)) or (rfa(6) and r6(1)) or (rfa(7) and r7(1));
	a(2) <= (rfa(0) and r0(2)) or (rfa(1) and r1(2)) or (rfa(2) and r2(2)) or (rfa(3) and r3(2)) or 
				(rfa(4) and r4(2)) or (rfa(5) and r5(2)) or (rfa(6) and r6(2)) or (rfa(7) and r7(2));
	a(3) <= (rfa(0) and r0(3)) or (rfa(1) and r1(3)) or (rfa(2) and r2(3)) or (rfa(3) and r3(3)) or 
				(rfa(4) and r4(3)) or (rfa(5) and r5(3)) or (rfa(6) and r6(3)) or (rfa(7) and r7(3));
	a(4) <= (rfa(0) and r0(4)) or (rfa(1) and r1(4)) or (rfa(2) and r2(4)) or (rfa(3) and r3(4)) or 
				(rfa(4) and r4(4)) or (rfa(5) and r5(4)) or (rfa(6) and r6(4)) or (rfa(7) and r7(4));
	a(5) <= (rfa(0) and r0(5)) or (rfa(1) and r1(5)) or (rfa(2) and r2(5)) or (rfa(3) and r3(5)) or 
				(rfa(4) and r4(5)) or (rfa(5) and r5(5)) or (rfa(6) and r6(5)) or (rfa(7) and r7(5));
	a(6) <= (rfa(0) and r0(6)) or (rfa(1) and r1(6)) or (rfa(2) and r2(6)) or (rfa(3) and r3(6)) or 
				(rfa(4) and r4(6)) or (rfa(5) and r5(6)) or (rfa(6) and r6(6)) or (rfa(7) and r7(6));
	a(7) <= (rfa(0) and r0(7)) or (rfa(1) and r1(7)) or (rfa(2) and r2(7)) or (rfa(3) and r3(7)) or 
				(rfa(4) and r4(7)) or (rfa(5) and r5(7)) or (rfa(6) and r6(7)) or (rfa(7) and r7(7));
	a(8) <= (rfa(0) and r0(8)) or (rfa(1) and r1(8)) or (rfa(2) and r2(8)) or (rfa(3) and r3(8)) or 
				(rfa(4) and r4(8)) or (rfa(5) and r5(8)) or (rfa(6) and r6(8)) or (rfa(7) and r7(8));
	a(9) <= (rfa(0) and r0(9)) or (rfa(1) and r1(9)) or (rfa(2) and r2(9)) or (rfa(3) and r3(9)) or 
				(rfa(4) and r4(9)) or (rfa(5) and r5(9)) or (rfa(6) and r6(9)) or (rfa(7) and r7(9));
	a(10) <= (rfa(0) and r0(10)) or (rfa(1) and r1(10)) or (rfa(2) and r2(10)) or (rfa(3) and r3(10)) or 
				(rfa(4) and r4(10)) or (rfa(5) and r5(10)) or (rfa(6) and r6(10)) or (rfa(7) and r7(10));
	a(11) <= (rfa(0) and r0(11)) or (rfa(1) and r1(11)) or (rfa(2) and r2(11)) or (rfa(3) and r3(11)) or 
				(rfa(4) and r4(11)) or (rfa(5) and r5(11)) or (rfa(6) and r6(11)) or (rfa(7) and r7(11));
	a(12) <= (rfa(0) and r0(12)) or (rfa(1) and r1(12)) or (rfa(2) and r2(12)) or (rfa(3) and r3(12)) or 
				(rfa(4) and r4(12)) or (rfa(5) and r5(12)) or (rfa(6) and r6(12)) or (rfa(7) and r7(12));
	a(13) <= (rfa(0) and r0(13)) or (rfa(1) and r1(13)) or (rfa(2) and r2(13)) or (rfa(3) and r3(13)) or 
				(rfa(4) and r4(13)) or (rfa(5) and r5(13)) or (rfa(6) and r6(13)) or (rfa(7) and r7(13));
	a(14) <= (rfa(0) and r0(14)) or (rfa(1) and r1(14)) or (rfa(2) and r2(14)) or (rfa(3) and r3(14)) or 
				(rfa(4) and r4(14)) or (rfa(5) and r5(14)) or (rfa(6) and r6(14)) or (rfa(7) and r7(14));
	a(15) <= (rfa(0) and r0(15)) or (rfa(1) and r1(15)) or (rfa(2) and r2(15)) or (rfa(3) and r3(15)) or 
				(rfa(4) and r4(15)) or (rfa(5) and r5(15)) or (rfa(6) and r6(15)) or (rfa(7) and r7(15));			
				
		
end beh;