library ieee;
use ieee.std_logic_1164.all;

package RegisterFile is 
	component Rf is
		port (Write_Select, Read_Select: IN std_logic_vector(6 downto 0);
					clock: IN std_logic;
					r1in, r2in, r3in, r4in, r5in, r6in, r0in: IN std_logic_vector(15 downto 0);
					r1out, r2out, r3out, r4out, r5out, r6out, r0out: out std_logic_vector(15 downto 0));
	end component;
end package RegisterFile;

library ieee;
use ieee.std_logic_1164.all;

entity Rf is
	port (Write_Select, Read_Select: IN std_logic_vector(6 downto 0);
				clock: IN std_logic;
				r1in, r2in, r3in, r4in, r5in, r6in, r0in: IN std_logic_vector(15 downto 0);
				r1out, r2out, r3out, r4out, r5out, r6out, r0out: out std_logic_vector(15 downto 0));
end entity;

architecture Beh of Rf is
TYPE mem IS ARRAY(0 TO 6) OF std_logic_vector(15 downto 0);
SIGNAL reg : mem;
begin
	process(clock)
	begin
		if (clock' event and clock='1') then
			if(Write_Select(0)='1') then
				reg(0) <= r0in; 
			end if;
			if(Write_Select(1)='1') then
				reg(1) <= r1in; 
			end if;
			if(Write_Select(2)='1') then
				reg(2) <= r2in; 
			end if;
			if(Write_Select(3)='1') then
				reg(3) <= r3in; 
			end if;
			if(Write_Select(4)='1') then
				reg(4) <= r4in; 
			end if;
			if(Write_Select(5)='1') then
				reg(5) <= r5in; 
			end if;
			if(Write_Select(6)='1') then
				reg(6) <= r6in; 
			end if;
		end if;
		if(Read_Select(0)='1') then
			r0out <= reg(0); 
		end if;
		if(Read_Select(1)='1') then
			r1out <= reg(1);
		end if;
		if(Read_Select(2)='1') then
			r2out <= reg(2); 
		end if;
		if(Read_Select(3)='1') then
			r3out <= reg(3);
		end if;
		if(Read_Select(4)='1') then
			r4out <= reg(4); 
		end if;
		if(Read_Select(5)='1') then
			r5out <= reg(5);
		end if;
		if(Read_Select(6)='1') then
			r6out <= reg(6);
		end if;
	end process;
end Beh;