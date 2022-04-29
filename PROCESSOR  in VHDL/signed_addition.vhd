----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.12.2020 00:10:04
-- Design Name: 
-- Module Name: signed_addition - Behavioral
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

entity signed_addition is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : in STD_LOGIC_VECTOR (15 downto 0);
           sum : out STD_LOGIC_VECTOR (15 downto 0);
           cout : out STD_LOGIC;
           cin : in STD_LOGIC);
end signed_addition;

architecture Behavioral of signed_addition is
component KS_Adder is
port(
    x   : IN std_logic_vector (15 downto 0);
    y   : IN std_logic_vector (15 downto 0);
    cin : IN std_logic;
    sum : OUT std_logic_vector (15 downto 0);
    cout: OUT std_logic);
end component;

component inverter is
    Port ( x : in STD_LOGIC_VECTOR (15 downto 0);
           y : out STD_LOGIC_VECTOR (15 downto 0));
end component;


begin
   sum1: KS_Adder port map(x => x, y => y, sum => sum, cout => cout, cin => cin); 

end Behavioral;
