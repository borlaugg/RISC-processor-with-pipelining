LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package Register16bit is 
	COMPONENT reg IS
		PORT
		(
			clock: IN std_logic;
			data:  IN   std_logic_vector(15 downto 0);
			write_enable:    IN   std_logic;
			read_enable:    IN   std_logic;
			data_out:     OUT  std_logic_vector(15 downto 0)
		);
	END COMPONENT;
end package Register16bit 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY reg IS
   PORT
   (
		clock: IN std_logic;
		data:  IN   std_logic_vector(15 downto 0);
		write_enable:    IN   std_logic;
		read_enable:    IN   std_logic;
		data_out:     OUT  std_logic_vector(15 downto 0)
   );
END reg;

ARCHITECTURE rtl OF reg IS
   TYPE mem IS ARRAY(0 TO 0) OF std_logic_vector(15 downto 0);
   SIGNAL reg : mem;
BEGIN
   PROCESS (clock)
   BEGIN
         IF (write_enable = '1') THEN
            reg(0) <= data;
			ELSIF (read_enable= '1') THEN
				data_out <= reg(0);
			END IF;
   END PROCESS;
END rtl;