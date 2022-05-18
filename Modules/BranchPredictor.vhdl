library ieee;
use ieee.std_logic_1164.all;

package branch_predictor is
	component BP is
		port(OPcode : IN std_logic_vector(3 downto 0);
			  clock : IN std_logic;
			  Prediction: OUT std_logic);
	end component; 
end package;

library ieee;
use ieee.std_logic_1164.all;

entity BP is
	port(OPcode : IN std_logic_vector(3 downto 0);
		  clock : IN std_logic;
		  Prediction: OUT std_logic);
end entity; 
architecture Beh of BP is
signal check: std_logic;
begin
	check <= OPcode(3) and (not OPcode(2));
	process (clock)
	begin
		if(clock' event and clock='1') then
			Prediction <= check;
			if (check='1' ) then
				Prediction <= '0' after 2000ns;
			end if;
		end if;
	end process;
end Beh;