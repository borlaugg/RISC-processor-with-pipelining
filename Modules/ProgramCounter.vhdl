LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package ProgramCounter is 
	COMPONENT PCounter IS
		PORT
		(
			clock: IN std_logic;
			data:  IN   std_logic_vector(15 downto 0);
			write_enable:    IN   std_logic;
			read_enable:    IN   std_logic;
			data_out:     OUT  std_logic_vector(15 downto 0)
		);
	END COMPONENT PCounter;
end package ProgramCounter;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY PCounter IS
   PORT
   (
		clock: IN std_logic;
		data:  IN   std_logic_vector(15 downto 0);
		write_enable:    IN   std_logic;
		read_enable:    IN   std_logic;
		data_out:     OUT  std_logic_vector(15 downto 0)
   );
END entity PCounter;

ARCHITECTURE rtl OF PCounter IS
   TYPE mem IS ARRAY(0 TO 0) OF std_logic_vector(15 downto 0);
   SIGNAL pc_reg : mem;
BEGIN
   PROCESS (clock)
   BEGIN
	IF (clock' event and clock='1' and write_enable = '1') THEN
            pc_reg(0) <= data;
	end if;
	IF (read_enable= '1') THEN
		data_out <= pc_reg(0);
	END IF;
   END PROCESS;
END rtl;