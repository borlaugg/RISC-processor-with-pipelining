----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02.12.2020 23:28:52
-- Design Name: 
-- Module Name: subtractor - Behavioral
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

entity subtractor is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           diff : out STD_LOGIC_VECTOR (15 downto 0);
           bout : out STD_LOGIC);
end subtractor;

architecture Behavioral of subtractor is

component KS_Adder is
port(
    x   : IN std_logic_vector (15 downto 0);
    y   : IN std_logic_vector (15 downto 0);
    cin : IN std_logic;
    sum : OUT std_logic_vector (15 downto 0);
    cout: OUT std_logic);
end component;

component inverter is
port(
    x : in STD_LOGIC_VECTOR (15 downto 0);
    y : out STD_LOGIC_VECTOR (15 downto 0)
);
end component;
signal ybar : STD_LOGIC_VECTOR (15 downto 0);
begin
invert: inverter port map(x => y, y => ybar);
sub: KS_Adder port map(x => x, y => ybar, cin => '1', sum => diff, cout => bout);

end Behavioral;
