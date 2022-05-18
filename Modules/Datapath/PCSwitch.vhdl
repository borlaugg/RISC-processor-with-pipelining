library ieee;
use ieee.std_logic_1164.all;
package PCSwitchpckg is
component PCSwitch is
port (bp:in std_logic;
		pcExec,pcIF : in std_logic_vector(15 downto 0);
		pc: out std_logic_vector(15 downto 0));
end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
entity PCSwitch is
port (bp:in std_logic;
		pcExec,pcIF : in std_logic_vector(15 downto 0);
		pc: out std_logic_vector(15 downto 0));
end entity;

architecture beh of PCSwitch is
begin
pc(15) <= (pcExec(15) and bp) or (pcIF(15) and (not bp));
pc(14) <= (pcExec(14) and bp) or (pcIF(14) and (not bp));
pc(13) <= (pcExec(13) and bp) or (pcIF(13) and (not bp));
pc(12) <= (pcExec(12) and bp) or (pcIF(12) and (not bp));
pc(11) <= (pcExec(11) and bp) or (pcIF(11) and (not bp));
pc(10) <= (pcExec(10) and bp) or (pcIF(10) and (not bp));
pc(9) <= (pcExec(9) and bp) or (pcIF(9) and (not bp));
pc(8) <= (pcExec(8) and bp) or (pcIF(8) and (not bp));
pc(7) <= (pcExec(7) and bp) or (pcIF(7) and (not bp));
pc(6) <= (pcExec(6) and bp) or (pcIF(6) and (not bp));
pc(5) <= (pcExec(5) and bp) or (pcIF(5) and (not bp));
pc(4) <= (pcExec(4) and bp) or (pcIF(4) and (not bp));
pc(3) <= (pcExec(3) and bp) or (pcIF(3) and (not bp));
pc(2) <= (pcExec(2) and bp) or (pcIF(2) and (not bp));
pc(1) <= (pcExec(1) and bp) or (pcIF(1) and (not bp));
pc(0) <= (pcExec(0) and bp) or (pcIF(0) and (not bp));
end beh;