library ieee;
use ieee.std_logic_1164.all;

package CZmuxpckg is
	component CZ_Mux is
		port(y_0,y_1,y_2,y_3: in std_logic_vector(15 downto 0);
			  yz: in std_logic_vector(1 downto 0);
			  cz_0, cz_1, cz_2, cz_3: in std_logic_vector(1 downto 0);
			  cz: out std_logic_vector(1 downto 0);
			  y:out std_logic_vector(15 downto 0));
	end component CZ_Mux;
	

end package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.mux4x1pkg.all;
entity CZ_Mux is
	port(y_0,y_1,y_2,y_3: in std_logic_vector(15 downto 0);
		  yz: in std_logic_vector(1 downto 0);
		  cz_0, cz_1, cz_2, cz_3: in std_logic_vector(1 downto 0);
		  cz: out std_logic_vector(1 downto 0);
		  y:out std_logic_vector(15 downto 0));
end entity CZ_Mux;

Architecture Beh of CZ_Mux is
begin
	mux1:for i in 0 to 15 generate
		M1: Mux_4 port map(Data_In(0) => y_0(i), Data_In(1) => y_1(i), Data_In(3) => y_3(i), Data_In(2) => y_2(i), Select_In => yz,
								Data_out => y(i));
	end generate;
	mux2:for i in 0 to 1 generate	
	M2: Mux_4 port map(Data_In(0) => cz_0(i), Data_In(1) => cz_1(i), Data_In(3) => cz_3(i), Data_In(2) => cz_2(i), Select_In => yz,
								Data_out => cz(i));	
	end generate;
end Beh;