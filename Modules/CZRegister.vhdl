LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package reg_2_bit is 
	COMPONENT Carry_zero_register IS
		PORT
		(
			clock: IN std_logic;
			data_C:  IN   std_logic;
			data_Z:  IN   std_logic;
			write_enable_C:    IN   std_logic;
			write_enable_Z:    IN   std_logic;
			read_enable_C:    IN   std_logic;
			read_enable_Z:    IN   std_logic;
			data_out_C:     OUT  std_logic;
			data_out_Z:     OUT  std_logic
		);
	END COMPONENT;
end package reg_2_bit;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY Carry_zero_register IS
   PORT
   (
		clock: IN std_logic;
		data_C:  IN   std_logic;
		data_Z:  IN   std_logic;
		write_enable_C:    IN   std_logic;
		write_enable_Z:    IN   std_logic;
		read_enable_C:    IN   std_logic;
		read_enable_Z:    IN   std_logic;
		data_out_C:     OUT  std_logic;
		data_out_Z:     OUT  std_logic
   );
END Carry_zero_register;

ARCHITECTURE rtl OF Carry_zero_register IS
   TYPE mem IS ARRAY(0 TO 0) OF std_logic;
   SIGNAL carry_reg, zero_reg : mem;
BEGIN
   PROCESS (clock)
   BEGIN
         IF (write_enable_C = '1') THEN
            carry_reg(0) <= data_C;
			END IF;
			IF (read_enable_C= '1') THEN
				data_out_C <= carry_reg(0);
			END IF;
			IF (write_enable_Z = '1') THEN
            zero_reg(0) <= data_Z;
			END IF;
			IF (read_enable_Z= '1') THEN
				data_out_Z <= zero_reg(0);
			END IF;
   END PROCESS;
END rtl;