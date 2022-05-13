library ieee;
use ieee.std_logic_1164.all;

package Mux16x1_16bit is
	component mux16bit is
		port(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15: in std_logic_vector(15 downto 0);
			 s: in std_logic_vector(3 downto 0);
			 o:out std_logic_vector(15 downto 0));
	end component mux16bit;

end package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Mux16.all;
entity mux16bit is
	port(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15: in std_logic_vector(15 downto 0);
			 s: in std_logic_vector(3 downto 0);
			 o:out std_logic_vector(15 downto 0));
end entity mux16bit;

Architecture Beh of mux16bit is
begin
	mux : for i in 0 to 15 generate
		m: Mux_16 port map(Data_In(0) => a0(i), Data_In(1) => a1(i), Data_In(2) => a2(i), Data_In(3) => a3(i), 
								 Data_In(4) => a4(i), Data_In(5) => a5(i), Data_In(6) => a6(i), Data_In(7) => a7(i), 
								 Data_In(8) => a8(i), Data_In(9) => a9(i), Data_In(10) => a10(i), Data_In(11) => a11(i), 
								 Data_In(12) => a12(i), Data_In(13) => a13(i), Data_In(14) => a14(i), Data_In(15) => a15(i),
								 Select_In => s, Data_Out => o(i));
   end generate ;
end Beh;