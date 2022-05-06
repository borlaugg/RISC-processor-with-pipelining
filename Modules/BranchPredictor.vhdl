library ieee;
use ieee.std_logic_1164.all;

package branch_predictor is
	component BP is
		port(OPcode : IN std_logic_vector(3 downto 0);
			  Prediction: OUT std_logic);
	end component; 
end package;

library ieee;
use ieee.std_logic_1164.all;

entity BP is
	port(OPcode : IN std_logic_vector(3 downto 0);
		  Prediction: OUT std_logic);
end entity; 
architecture Beh of BP is
begin
	Prediction <= OPcode(3) and (not OPcode(2));
end Beh;