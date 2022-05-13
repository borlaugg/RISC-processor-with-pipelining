library ieee;
use ieee.std_logic_1164.all;
package mux2x1_16bit is
	component mux is
		port (a,b: in std_logic_vector(15 downto 0); s: in std_logic; y: out std_logic_vector(15 downto 0));
	end component;
end package;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.Muxpkg1.all;
entity mux is
	port (a,b: in std_logic_vector(15 downto 0); s: in std_logic; y: out std_logic_vector(15 downto 0));
end entity mux;

architecture beh of mux is
begin
	 mux : for i in 0 to 15 generate
		m: Mux2x1 port map(I0 => a(i), I1 => b(i), S => s, Y => y(i));
    end generate ; 
end beh;