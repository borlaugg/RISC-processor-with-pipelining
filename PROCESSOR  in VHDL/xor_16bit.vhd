----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2020 23:56:26
-- Design Name: 
-- Module Name: xor_16bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity xor_16bit is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           z : out STD_LOGIC_VECTOR (15 downto 0));
end xor_16bit;

architecture Behavioral of xor_16bit is
component xor_2bit is
  Port ( 
    x : in std_logic;
    y : in std_logic;
    z : out std_logic
  );
end component;

begin
b0: xor_2bit port map( x => x(0), y => y(0), z => z(0));
b1: xor_2bit port map( x => x(1), y => y(1), z => z(1));
b2: xor_2bit port map( x => x(2), y => y(2), z => z(2));
b3: xor_2bit port map( x => x(3), y => y(3), z => z(3));
b4: xor_2bit port map( x => x(4), y => y(4), z => z(4));
b5: xor_2bit port map( x => x(5), y => y(5), z => z(5));
b6: xor_2bit port map( x => x(6), y => y(6), z => z(6));
b7: xor_2bit port map( x => x(7), y => y(7), z => z(7));
b8: xor_2bit port map( x => x(8), y => y(8), z => z(8));
b9: xor_2bit port map( x => x(9), y => y(9), z => z(9));
b10: xor_2bit port map( x => x(10), y => y(10), z => z(10));
b11: xor_2bit port map( x => x(11), y => y(11), z => z(11));
b12: xor_2bit port map( x => x(12), y => y(12), z => z(12));
b13: xor_2bit port map( x => x(13), y => y(13), z => z(13));
b14: xor_2bit port map( x => x(14), y => y(14), z => z(14));
b15: xor_2bit port map( x => x(15), y => y(15), z => z(15));

end Behavioral;
