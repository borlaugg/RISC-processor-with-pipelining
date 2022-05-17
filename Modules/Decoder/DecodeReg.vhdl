library ieee;
use ieee.std_logic_1164.all;
package DecodeRegpkg is
	component DecodeReg is
		port (ra : IN std_logic_vector(2 downto 0);
				rf : OUT std_logic_vector(7 downto 0));
	end component DecodeReg;
end package;
library ieee;
use ieee.std_logic_1164.all;
entity DecodeReg is
	port (ra : IN std_logic_vector(2 downto 0);
			rf : OUT std_logic_vector(7 downto 0));
end entity;

architecture beh of DecodeReg is
begin
	rf(0) <= (not ra(2)) and (not ra(1)) and (not ra(0));
	rf(1) <= (not ra(2)) and (not ra(1)) and ra(0);
	rf(2) <= (not ra(0)) and (not ra(0)) and ra(1);
	rf(3) <= (not ra(2)) and  ra(1) and ra(0);
	rf(4) <= (not ra(0)) and (not ra(1)) and ra(2);
	rf(5) <= ra(2) and (not ra(1)) and ra(0);
	rf(6) <= (not ra(0)) and ra(1) and ra(2);
	rf(7) <= ra(2) and ra(1) and ra(0);
end beh;