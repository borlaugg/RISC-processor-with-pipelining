library ieee;
use ieee.std_logic_1164.all;

package postALUmux is
component postmux is
	port(rf_ws : in std_logic_vector(7 downto 0);
		  y, r0,r1,r2,r3,r4,r5,r6,r7: in std_logic_vector(15 downto 0);
		  ro0,ro1,ro2,ro3,ro4,ro5,ro6,ro7: out std_logic_vector(15 downto 0));
end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
entity postmux is
	port(rf_ws : in std_logic_vector(7 downto 0);
		  y, r0,r1,r2,r3,r4,r5,r6,r7: in std_logic_vector(15 downto 0);
		  ro0,ro1,ro2,ro3,ro4,ro5,ro6,ro7: out std_logic_vector(15 downto 0));
end entity;

architecture beh of postmux is
begin
	ro0(0) <= (y(0) and rf_ws(0)) or (r0(0) and (not rf_ws(0)));
	ro1(0) <= (y(0) and rf_ws(1)) or (r1(0) and (not rf_ws(1)));
	ro2(0) <= (y(0) and rf_ws(2)) or (r2(0) and (not rf_ws(2)));
	ro3(0) <= (y(0) and rf_ws(3)) or (r3(0) and (not rf_ws(3)));
	ro4(0) <= (y(0) and rf_ws(4)) or (r4(0) and (not rf_ws(4)));
	ro5(0) <= (y(0) and rf_ws(5)) or (r5(0) and (not rf_ws(5)));
	ro6(0) <= (y(0) and rf_ws(6)) or (r6(0) and (not rf_ws(6)));
	ro7(0) <= (y(0) and rf_ws(7)) or (r7(0) and (not rf_ws(7)));
	
	ro0(1) <= (y(1) and rf_ws(0)) or (r0(1) and (not rf_ws(0)));
	ro1(1) <= (y(1) and rf_ws(1)) or (r1(1) and (not rf_ws(1)));
	ro2(1) <= (y(1) and rf_ws(2)) or (r2(1) and (not rf_ws(2)));
	ro3(1) <= (y(1) and rf_ws(3)) or (r3(1) and (not rf_ws(3)));
	ro4(1) <= (y(1) and rf_ws(4)) or (r4(1) and (not rf_ws(4)));
	ro5(1) <= (y(1) and rf_ws(5)) or (r5(1) and (not rf_ws(5)));
	ro6(1) <= (y(1) and rf_ws(6)) or (r6(1) and (not rf_ws(6)));
	ro7(1) <= (y(1) and rf_ws(7)) or (r7(1) and (not rf_ws(7)));
	
	ro0(2) <= (y(2) and rf_ws(0)) or (r0(2) and (not rf_ws(0)));
	ro1(2) <= (y(2) and rf_ws(1)) or (r1(2) and (not rf_ws(1)));
	ro2(2) <= (y(2) and rf_ws(2)) or (r2(2) and (not rf_ws(2)));
	ro3(2) <= (y(2) and rf_ws(3)) or (r3(2) and (not rf_ws(3)));
	ro4(2) <= (y(2) and rf_ws(4)) or (r4(2) and (not rf_ws(4)));
	ro5(2) <= (y(2) and rf_ws(5)) or (r5(2) and (not rf_ws(5)));
	ro6(2) <= (y(2) and rf_ws(6)) or (r6(2) and (not rf_ws(6)));
	ro7(2) <= (y(2) and rf_ws(7)) or (r7(2) and (not rf_ws(7)));
	
	ro0(3) <= (y(3) and rf_ws(0)) or (r0(3) and (not rf_ws(0)));
	ro1(3) <= (y(3) and rf_ws(1)) or (r1(3) and (not rf_ws(1)));
	ro2(3) <= (y(3) and rf_ws(2)) or (r2(3) and (not rf_ws(2)));
	ro3(3) <= (y(3) and rf_ws(3)) or (r3(3) and (not rf_ws(3)));
	ro4(3) <= (y(3) and rf_ws(4)) or (r4(3) and (not rf_ws(4)));
	ro5(3) <= (y(3) and rf_ws(5)) or (r5(3) and (not rf_ws(5)));
	ro6(3) <= (y(3) and rf_ws(6)) or (r6(3) and (not rf_ws(6)));
	ro7(3) <= (y(3) and rf_ws(7)) or (r7(3) and (not rf_ws(7)));
	
	ro0(4) <= (y(4) and rf_ws(0)) or (r0(4) and (not rf_ws(0)));
	ro1(4) <= (y(4) and rf_ws(1)) or (r1(4) and (not rf_ws(1)));
	ro2(4) <= (y(4) and rf_ws(2)) or (r2(4) and (not rf_ws(2)));
	ro3(4) <= (y(4) and rf_ws(3)) or (r3(4) and (not rf_ws(3)));
	ro4(4) <= (y(4) and rf_ws(4)) or (r4(4) and (not rf_ws(4)));
	ro5(4) <= (y(4) and rf_ws(5)) or (r5(4) and (not rf_ws(5)));
	ro6(4) <= (y(4) and rf_ws(6)) or (r6(4) and (not rf_ws(6)));
	ro7(4) <= (y(4) and rf_ws(7)) or (r7(4) and (not rf_ws(7)));
	
	ro0(5) <= (y(5) and rf_ws(0)) or (r0(5) and (not rf_ws(0)));
	ro1(5) <= (y(5) and rf_ws(1)) or (r1(5) and (not rf_ws(1)));
	ro2(5) <= (y(5) and rf_ws(2)) or (r2(5) and (not rf_ws(2)));
	ro3(5) <= (y(5) and rf_ws(3)) or (r3(5) and (not rf_ws(3)));
	ro4(5) <= (y(5) and rf_ws(4)) or (r4(5) and (not rf_ws(4)));
	ro5(5) <= (y(5) and rf_ws(5)) or (r5(5) and (not rf_ws(5)));
	ro6(5) <= (y(5) and rf_ws(6)) or (r6(5) and (not rf_ws(6)));
	ro7(5) <= (y(5) and rf_ws(7)) or (r7(5) and (not rf_ws(7)));
	
	ro0(6) <= (y(6) and rf_ws(0)) or (r0(6) and (not rf_ws(0)));
	ro1(6) <= (y(6) and rf_ws(1)) or (r1(6) and (not rf_ws(1)));
	ro2(6) <= (y(6) and rf_ws(2)) or (r2(6) and (not rf_ws(2)));
	ro3(6) <= (y(6) and rf_ws(3)) or (r3(6) and (not rf_ws(3)));
	ro4(6) <= (y(6) and rf_ws(4)) or (r4(6) and (not rf_ws(4)));
	ro5(6) <= (y(6) and rf_ws(5)) or (r5(6) and (not rf_ws(5)));
	ro6(6) <= (y(6) and rf_ws(6)) or (r6(6) and (not rf_ws(6)));
	ro7(6) <= (y(6) and rf_ws(7)) or (r7(6) and (not rf_ws(7)));
	
	ro0(7) <= (y(7) and rf_ws(0)) or (r0(7) and (not rf_ws(0)));
	ro1(7) <= (y(7) and rf_ws(1)) or (r1(7) and (not rf_ws(1)));
	ro2(7) <= (y(7) and rf_ws(2)) or (r2(7) and (not rf_ws(2)));
	ro3(7) <= (y(7) and rf_ws(3)) or (r3(7) and (not rf_ws(3)));
	ro4(7) <= (y(7) and rf_ws(4)) or (r4(7) and (not rf_ws(4)));
	ro5(7) <= (y(7) and rf_ws(5)) or (r5(7) and (not rf_ws(5)));
	ro6(7) <= (y(7) and rf_ws(6)) or (r6(7) and (not rf_ws(6)));
	ro7(7) <= (y(7) and rf_ws(7)) or (r7(7) and (not rf_ws(7)));
	
	ro0(8) <= (y(8) and rf_ws(0)) or (r0(8) and (not rf_ws(0)));
	ro1(8) <= (y(8) and rf_ws(1)) or (r1(8) and (not rf_ws(1)));
	ro2(8) <= (y(8) and rf_ws(2)) or (r2(8) and (not rf_ws(2)));
	ro3(8) <= (y(8) and rf_ws(3)) or (r3(8) and (not rf_ws(3)));
	ro4(8) <= (y(8) and rf_ws(4)) or (r4(8) and (not rf_ws(4)));
	ro5(8) <= (y(8) and rf_ws(5)) or (r5(8) and (not rf_ws(5)));
	ro6(8) <= (y(8) and rf_ws(6)) or (r6(8) and (not rf_ws(6)));
	ro7(8) <= (y(8) and rf_ws(7)) or (r7(8) and (not rf_ws(7)));
	
	ro0(9) <= (y(9) and rf_ws(0)) or (r0(9) and (not rf_ws(0)));
	ro1(9) <= (y(9) and rf_ws(1)) or (r1(9) and (not rf_ws(1)));
	ro2(9) <= (y(9) and rf_ws(2)) or (r2(9) and (not rf_ws(2)));
	ro3(9) <= (y(9) and rf_ws(3)) or (r3(9) and (not rf_ws(3)));
	ro4(9) <= (y(9) and rf_ws(4)) or (r4(9) and (not rf_ws(4)));
	ro5(9) <= (y(9) and rf_ws(5)) or (r5(9) and (not rf_ws(5)));
	ro6(9) <= (y(9) and rf_ws(6)) or (r6(9) and (not rf_ws(6)));
	ro7(9) <= (y(9) and rf_ws(7)) or (r7(9) and (not rf_ws(7)));
	
	ro0(10) <= (y(10) and rf_ws(0)) or (r0(10) and (not rf_ws(0)));
	ro1(10) <= (y(10) and rf_ws(1)) or (r1(10) and (not rf_ws(1)));
	ro2(10) <= (y(10) and rf_ws(2)) or (r2(10) and (not rf_ws(2)));
	ro3(10) <= (y(10) and rf_ws(3)) or (r3(10) and (not rf_ws(3)));
	ro4(10) <= (y(10) and rf_ws(4)) or (r4(10) and (not rf_ws(4)));
	ro5(10) <= (y(10) and rf_ws(5)) or (r5(10) and (not rf_ws(5)));
	ro6(10) <= (y(10) and rf_ws(6)) or (r6(10) and (not rf_ws(6)));
	ro7(10) <= (y(10) and rf_ws(7)) or (r7(10) and (not rf_ws(7)));
	
	ro0(11) <= (y(11) and rf_ws(0)) or (r0(11) and (not rf_ws(0)));
	ro1(11) <= (y(11) and rf_ws(1)) or (r1(11) and (not rf_ws(1)));
	ro2(11) <= (y(11) and rf_ws(2)) or (r2(11) and (not rf_ws(2)));
	ro3(11) <= (y(11) and rf_ws(3)) or (r3(11) and (not rf_ws(3)));
	ro4(11) <= (y(11) and rf_ws(4)) or (r4(11) and (not rf_ws(4)));
	ro5(11) <= (y(11) and rf_ws(5)) or (r5(11) and (not rf_ws(5)));
	ro6(11) <= (y(11) and rf_ws(6)) or (r6(11) and (not rf_ws(6)));
	ro7(11) <= (y(11) and rf_ws(7)) or (r7(11) and (not rf_ws(7)));
	
	ro0(12) <= (y(12) and rf_ws(0)) or (r0(12) and (not rf_ws(0)));
	ro1(12) <= (y(12) and rf_ws(1)) or (r1(12) and (not rf_ws(1)));
	ro2(12) <= (y(12) and rf_ws(2)) or (r2(12) and (not rf_ws(2)));
	ro3(12) <= (y(12) and rf_ws(3)) or (r3(12) and (not rf_ws(3)));
	ro4(12) <= (y(12) and rf_ws(4)) or (r4(12) and (not rf_ws(4)));
	ro5(12) <= (y(12) and rf_ws(5)) or (r5(12) and (not rf_ws(5)));
	ro6(12) <= (y(12) and rf_ws(6)) or (r6(12) and (not rf_ws(6)));
	ro7(12) <= (y(12) and rf_ws(7)) or (r7(12) and (not rf_ws(7)));
	
	ro0(13) <= (y(13) and rf_ws(0)) or (r0(13) and (not rf_ws(0)));
	ro1(13) <= (y(13) and rf_ws(1)) or (r1(13) and (not rf_ws(1)));
	ro2(13) <= (y(13) and rf_ws(2)) or (r2(13) and (not rf_ws(2)));
	ro3(13) <= (y(13) and rf_ws(3)) or (r3(13) and (not rf_ws(3)));
	ro4(13) <= (y(13) and rf_ws(4)) or (r4(13) and (not rf_ws(4)));
	ro5(13) <= (y(13) and rf_ws(5)) or (r5(13) and (not rf_ws(5)));
	ro6(13) <= (y(13) and rf_ws(6)) or (r6(13) and (not rf_ws(6)));
	ro7(13) <= (y(13) and rf_ws(7)) or (r7(13) and (not rf_ws(7)));
	
	ro0(14) <= (y(14) and rf_ws(0)) or (r0(14) and (not rf_ws(0)));
	ro1(14) <= (y(14) and rf_ws(1)) or (r1(14) and (not rf_ws(1)));
	ro2(14) <= (y(14) and rf_ws(2)) or (r2(14) and (not rf_ws(2)));
	ro3(14) <= (y(14) and rf_ws(3)) or (r3(14) and (not rf_ws(3)));
	ro4(14) <= (y(14) and rf_ws(4)) or (r4(14) and (not rf_ws(4)));
	ro5(14) <= (y(14) and rf_ws(5)) or (r5(14) and (not rf_ws(5)));
	ro6(14) <= (y(14) and rf_ws(6)) or (r6(14) and (not rf_ws(6)));
	ro7(14) <= (y(14) and rf_ws(7)) or (r7(14) and (not rf_ws(7)));
	
	ro0(15) <= (y(15) and rf_ws(0)) or (r0(15) and (not rf_ws(0)));
	ro1(15) <= (y(15) and rf_ws(1)) or (r1(15) and (not rf_ws(1)));
	ro2(15) <= (y(15) and rf_ws(2)) or (r2(15) and (not rf_ws(2)));
	ro3(15) <= (y(15) and rf_ws(3)) or (r3(15) and (not rf_ws(3)));
	ro4(15) <= (y(15) and rf_ws(4)) or (r4(15) and (not rf_ws(4)));
	ro5(15) <= (y(15) and rf_ws(5)) or (r5(15) and (not rf_ws(5)));
	ro6(15) <= (y(15) and rf_ws(6)) or (r6(15) and (not rf_ws(6)));
	ro7(15) <= (y(15) and rf_ws(7)) or (r7(15) and (not rf_ws(7)));
end beh;