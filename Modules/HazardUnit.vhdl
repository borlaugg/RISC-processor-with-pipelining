LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package HazardUnit is 
	COMPONENT DH IS
		PORT
		(Write_Select_Prev, Read_Select_Curr: IN std_logic_vector(7 downto 0); P : OUT std_logic);
	END COMPONENT;
end package HazardUnit;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY DH IS
   PORT
   (Write_Select_Prev, Read_Select_Curr: IN std_logic_vector(7 downto 0); P : OUT std_logic);
END DH;

ARCHITECTURE beh OF DH IS
BEGIN
	P <= (Write_Select_Prev(0) and Read_Select_Curr(0)) or (Write_Select_Prev(1) and Read_Select_Curr(1)) or
			(Write_Select_Prev(2) and Read_Select_Curr(2)) or (Write_Select_Prev(3) and Read_Select_Curr(3)) or
			(Write_Select_Prev(4) and Read_Select_Curr(4)) or (Write_Select_Prev(5) and Read_Select_Curr(5)) or
			(Write_Select_Prev(6) and Read_Select_Curr(6)) or (Write_Select_Prev(7) and Read_Select_Curr(7));
END beh;