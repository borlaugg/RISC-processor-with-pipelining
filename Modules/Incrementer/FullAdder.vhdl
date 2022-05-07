library ieee;
use ieee.std_logic_1164.all;

package FullAdder is
	component Full_Adder  is
	  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
	end component Full_Adder;
end package FullAdder;

library ieee;
use ieee.std_logic_1164.all;
library work;
use work.HalfAdder.all;

entity Full_Adder  is
  port (A, B, Cin: in std_logic; S, Cout: out std_logic);
end entity Full_Adder;
architecture Struct of Full_Adder is
  signal tC, tS, U, V: std_logic;
begin
  -- component instances
  ha: Half_Adder 
       port map (A => A, B => B, S => tS, C => tC);
  V <= tS and Cin;
  Cout <= tC or V;
  S <= tS xor Cin;
end Struct;
