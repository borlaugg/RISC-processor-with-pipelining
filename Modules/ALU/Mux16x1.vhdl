library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

package Mux16 is
	 component Mux_16 is
		port
		(
			Data_In  :in  std_logic_vector(15 downto 0);
			Select_In :in  std_logic_vector(3 downto 0);
			Data_Out :out  std_logic
		);
	end component Mux_16;
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux_16 is
port
(
Data_In  :in  std_logic_vector(15 downto 0);
Select_In :in  std_logic_vector(3 downto 0);
Data_Out :out  std_logic
);
end Mux_16;

architecture Behavioral of Mux_16 is

--4:1 Mux Component Instantiation
component Mux_4 is
port
(
Data_In  :in  std_logic_vector(3 downto 0);
Select_In :in  std_logic_vector(1 downto 0);
Data_Out  :out  std_logic
);
end component;

signal S_Data_Out:std_logic_vector(3 downto 0);
begin

--Stage 1 Mapping

G_MUX_4:for V_I in 0 to 3 generate
U_Mux_4_1:Mux_4
port map
(
Data_In  => Data_In(V_I*4+3 downto V_I*4),
Select_In => Select_In(1 Downto 0),
Data_Out => S_Data_Out(V_I)
);
end generate;

--Stage 2 Mapping

U_Mux_4_2:Mux_4
port map
(
Data_In  =>  S_Data_Out,
Select_In =>  Select_In(3 Downto 2),
Data_Out =>  Data_Out
);

end Behavioral;