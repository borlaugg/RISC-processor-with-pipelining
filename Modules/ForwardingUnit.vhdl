library ieee;
use ieee.std_logic_1164.all;
package ForwardingUnitpkg is
	component FwdUnit is
		port (dh: IN std_logic;
				aRR,aExec: IN std_logic_vector(15 downto 0);
				a : OUT std_logic_vector(15 downto 0));
	end component;
end package;


library ieee;
use ieee.std_logic_1164.all;
entity FwdUnit is
	port (dh: IN std_logic;
			aRR,aExec: IN std_logic_vector(15 downto 0);
			a : OUT std_logic_vector(15 downto 0));
end entity;

architecture beh of FwdUnit is
signal aRR2, aExec2 : std_logic_vector(15 downto 0);
begin
	aRR2(0) <= aRR(0) and (not dh);
	aRR2(1) <= aRR(1) and (not dh);
	aRR2(2) <= aRR(2) and (not dh);
	aRR2(3) <= aRR(3) and (not dh);
	aRR2(4) <= aRR(4) and (not dh);
	aRR2(5) <= aRR(5) and (not dh);
	aRR2(6) <= aRR(6) and (not dh);
	aRR2(7) <= aRR(7) and (not dh);
	aRR2(8) <= aRR(8) and (not dh);
	aRR2(9) <= aRR(9) and (not dh);
	aRR2(10) <= aRR(10) and (not dh);
	aRR2(11) <= aRR(11) and (not dh);
	aRR2(12) <= aRR(12) and (not dh);
	aRR2(13) <= aRR(13) and (not dh);
	aRR2(14) <= aRR(14) and (not dh);
	aRR2(15) <= aRR(15) and (not dh);
	aExec2(0) <= aExec(0) and dh;
	aExec2(1) <= aExec(1) and dh;
	aExec2(2) <= aExec(2) and dh;
	aExec2(3) <= aExec(3) and dh;
	aExec2(4) <= aExec(4) and dh ;
	aExec2(5) <= aExec(5) and dh;
	aExec2(6) <= aExec(6) and dh;
	aExec2(7) <= aExec(7) and dh;
	aExec2(8) <= aExec(8) and dh ;
	aExec2(9) <= aExec(9) and dh ;
	aExec2(10) <= aExec(10) and dh ;
	aExec2(11) <= aExec(11) and dh ;
	aExec2(12) <= aExec(12) and dh ;
	aExec2(13) <= aExec(13) and dh ;
	aExec2(14) <= aExec(14) and dh ;
	aExec2(15) <= aExec(15) and dh ;
	a <= aExec2 or aRR2;
end beh;