LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package DM is 
	COMPONENT RAM IS
		PORT
		(
			clock: IN   std_logic;
			data1,data2,data3,data4,data5,data6,data7:  IN   std_logic_vector (15 DOWNTO 0);
			write_address0:  IN   std_logic_vector (15 DOWNTO 0);
			read_address0:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable0:    IN   std_logic;
			read_enable0:    IN   std_logic;
			write_address1:  IN   std_logic_vector (15 DOWNTO 0);
			read_address1:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable1:    IN   std_logic;
			read_enable1:    IN   std_logic;
			write_address2:  IN   std_logic_vector (15 DOWNTO 0);
			read_address2:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable2:    IN   std_logic;
			read_enable2:    IN   std_logic;
			write_address3:  IN   std_logic_vector (15 DOWNTO 0);
			read_address3:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable3:    IN   std_logic;
			read_enable3:    IN   std_logic;
			write_address4:  IN   std_logic_vector (15 DOWNTO 0);
			read_address4:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable4:    IN   std_logic;
			read_enable4:    IN   std_logic;
			write_address5:  IN   std_logic_vector (15 DOWNTO 0);
			read_address5:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable5:    IN   std_logic;
			read_enable5:    IN   std_logic;
			write_address6:  IN   std_logic_vector (15 DOWNTO 0);
			read_address6:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable6:    IN   std_logic;
			read_enable6:    IN   std_logic;
			write_address7:  IN   std_logic_vector (15 DOWNTO 0);
			read_address7:  IN   std_logic_vector (15 DOWNTO 0);
			write_enable7:    IN   std_logic;
			read_enable7:    IN   std_logic;
			data_out0:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out1:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out2:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out3:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out4:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out5:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out6:     OUT  std_logic_vector (15 DOWNTO 0);
			data_out7:     OUT  std_logic_vector (15 DOWNTO 0);
		);
	END COMPONENT;
end package DM;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
ENTITY RAM IS
   PORT
   (
      clock: IN   std_logic;
      data1,data2,data3,data4,data5,data6,data7:  IN   std_logic_vector (15 DOWNTO 0);
		write_address0:  IN   std_logic_vector (15 DOWNTO 0);
		read_address0:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable0:    IN   std_logic;
		read_enable0:    IN   std_logic;
      write_address1:  IN   std_logic_vector (15 DOWNTO 0);
		read_address1:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable1:    IN   std_logic;
		read_enable1:    IN   std_logic;
		write_address2:  IN   std_logic_vector (15 DOWNTO 0);
		read_address2:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable2:    IN   std_logic;
		read_enable2:    IN   std_logic;
		write_address3:  IN   std_logic_vector (15 DOWNTO 0);
		read_address3:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable3:    IN   std_logic;
		read_enable3:    IN   std_logic;
		write_address4:  IN   std_logic_vector (15 DOWNTO 0);
		read_address4:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable4:    IN   std_logic;
		read_enable4:    IN   std_logic;
		write_address5:  IN   std_logic_vector (15 DOWNTO 0);
		read_address5:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable5:    IN   std_logic;
		read_enable5:    IN   std_logic;
		write_address6:  IN   std_logic_vector (15 DOWNTO 0);
		read_address6:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable6:    IN   std_logic;
		read_enable6:    IN   std_logic;
		write_address7:  IN   std_logic_vector (15 DOWNTO 0);
		read_address7:  IN   std_logic_vector (15 DOWNTO 0);
      write_enable7:    IN   std_logic;
		read_enable7:    IN   std_logic;
      data_out0:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out1:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out2:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out3:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out4:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out5:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out6:     OUT  std_logic_vector (15 DOWNTO 0);
		data_out7:     OUT  std_logic_vector (15 DOWNTO 0);
   );
END RAM;
ARCHITECTURE rtl OF RAM IS
   TYPE mem IS ARRAY(0 TO 65536) OF std_logic_vector(15 DOWNTO 0);
   SIGNAL ram_block : mem;
BEGIN
   PROCESS (clock)
   BEGIN
      IF (clock'event AND clock = '1') THEN
         IF (write_enable0 = '1') THEN
            ram_block(to_integer(unsigned(write_address0))) <= data1;
			END IF;
			IF (write_enable1 = '1') THEN
            ram_block(to_integer(unsigned(write_address2))) <= data2;
			END IF;
			IF (write_enable3 = '1') THEN
            ram_block(to_integer(unsigned(write_address3))) <= data3;
			END IF;
			IF (write_enable4 = '1') THEN
            ram_block(to_integer(unsigned(write_address4))) <= data4;
			END IF;
			IF (write_enable5 = '1') THEN
            ram_block(to_integer(unsigned(write_address5))) <= data5;
			END IF;
			IF (write_enable6 = '1') THEN
            ram_block(to_integer(unsigned(write_address6))) <= data6;	
			END IF;
			IF (write_enable7 = '1') THEN
            ram_block(to_integer(unsigned(write_address7))) <= data7;	
			END IF;
			IF (read_enable0= '1') THEN
				data_out0 <= ram_block(to_integer(unsigned(read_address0)));
			END IF;
			IF (read_enable1= '1') THEN
				data_out1 <= ram_block(to_integer(unsigned(read_address1)));
			END IF;
			IF (read_enable2= '1') THEN
				data_out2 <= ram_block(to_integer(unsigned(read_address2)));
			END IF;
			IF (read_enable3= '1') THEN
				data_out3 <= ram_block(to_integer(unsigned(read_address3)));
			END IF;
			IF (read_enable4= '1') THEN
				data_out4 <= ram_block(to_integer(unsigned(read_address4)));
			END IF;
			IF (read_enable5= '1') THEN
				data_out5 <= ram_block(to_integer(unsigned(read_address5)));
			END IF;
			IF (read_enable6= '1') THEN
				data_out6 <= ram_block(to_integer(unsigned(read_address6)));
			END IF;
			IF (read_enable7= '1') THEN
				data_out7 <= ram_block(to_integer(unsigned(read_address7)));
			END IF;
      END IF;
   END PROCESS;
END rtl;