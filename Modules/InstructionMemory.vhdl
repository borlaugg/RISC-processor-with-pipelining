LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package IM is 
	COMPONENT ROM IS
		PORT
		(
			clock: IN   std_logic;
			data:  IN   std_logic_vector (15 DOWNTO 0);
			write_address:  IN   std_logic_vector (15 DOWNTO 0);
			read_address:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable:    IN   std_logic;
			read_enable:    IN   std_logic;
			data_out:     OUT  std_logic_vector (15 DOWNTO 0)
		);
	END COMPONENT;
end package IM;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY ROM IS
   PORT
   (
      clock: IN   std_logic;
      data:  IN   std_logic_vector (15 DOWNTO 0);
		write_address:  IN   std_logic_vector (15 DOWNTO 0);
		read_address:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable:    IN   std_logic;
		read_enable:    IN   std_logic;
      data_out:     OUT  std_logic_vector (15 DOWNTO 0)
   );
END ROM;
ARCHITECTURE rtl OF ROM IS
   TYPE mem IS ARRAY(0 TO 15) OF std_logic_vector(15 DOWNTO 0);
   SIGNAL rom_block : mem;
BEGIN
   PROCESS (clock)
   BEGIN
      IF (clock'event AND clock = '1') THEN
         IF (write_enable = '1') THEN
            rom_block(to_integer(unsigned(write_address))) <= data;
			END IF;
			IF (read_enable= '1') THEN
				data_out <= rom_block(to_integer(unsigned(read_address)));
			END IF;
      END IF;
   END PROCESS;
END rtl;