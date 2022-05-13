library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

PACKAGE mux4x1pkg is
component Mux_4 is
port
(
Data_In  :in  std_logic_vector(3 downto 0);
Select_In :in  std_logic_vector(1 downto 0);
Data_Out :out  std_logic
);
end component Mux_4;
end package;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Mux_4 is
port
(
Data_In  :in  std_logic_vector(3 downto 0);
Select_In :in  std_logic_vector(1 downto 0);
Data_Out :out  std_logic
);
end entity Mux_4;

architecture Behavioral of Mux_4 is

begin
Data_Out <= (not Select_In(1) and not Select_In(0) and Data_In(3) )  or (not Select_In(1) and Select_In(0) and Data_In(2)) 
   or (Select_In(1) and not Select_In(0) and Data_In(1)) 
   or (Select_In(1) and Select_In(0) and Data_In(0));
   
end Behavioral;