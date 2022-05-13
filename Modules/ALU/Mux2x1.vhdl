library ieee;
use ieee.std_logic_1164.all;
package Muxpkg1 is
component Mux2x1 is
port (I0,I1,S:in std_logic;
			Y:out std_logic);
end component Mux2x1;
end package Muxpkg1;


library ieee;
use ieee.std_logic_1164.all;
entity Mux2x1 is
	port (I0,I1,S:in std_logic;
			Y:out std_logic);
end entity Mux2x1;

architecture Beh of Mux2x1 is
	signal A,B,S0: std_logic;
begin
	S0 <= not S;
	A<= I0 and S0;
	B <= I1 and S;
	Y <= A or B;
end Beh;