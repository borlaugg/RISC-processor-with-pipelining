LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
package HazardUnit is 
	COMPONENT DH IS
		PORT
		(
			control_bit, clock: IN std_logic;
			cz :  IN   std_logic_vector(1 downto 0);
			Current_ins:  IN   std_logic_vector(15 downto 0);
			P:     OUT  std_logic
		);
	END COMPONENT;
end package HazardUnit;

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;
library work;
use work.Register16bit.all;
use work.reg_2_bit.all;
ENTITY DH IS
   PORT
   (
		control_bit, clock: IN std_logic;
		cz :  IN   std_logic_vector(1 downto 0);
		Current_ins:  IN   std_logic_vector(15 downto 0);
		P:     OUT  std_logic
   );
END DH;

ARCHITECTURE beh OF DH IS
signal Previns : std_logic_vector(15 downto 0);
signal PrevOPcode, OPcode : std_logic_vector(3 downto 0);
signal Prevyz, yz, Prevcz : std_logic_vector(1 downto 0);
signal write_enable, flag_RegAccessed, flag_RegWritten : std_logic; 
signal regWritten, regAccessed0, regAccessed1: std_logic_vector(2 downto 0);
BEGIN
	reg2: Carry_zero_register port map(clock => clock, data_C=> cz(1), data_Z=>cz(0) ,
													write_enable_C=> write_enable, write_enable_Z=> write_enable, 
													read_enable_Z=>'1', read_enable_C=>'1', data_out_C=> Prevcz(1),
													data_out_Z=>Prevcz(0));
	reg16: reg port map(clock => clock, data => Current_ins, read_enable => '1', write_enable => write_enable,
							  data_out =>Previns);
	OPcode <= Current_ins(15 downto 12);
	yz <= Current_ins(1 downto 0);
	PrevOPcode <= Previns(15 downto 12);
	Prevyz <= Previns(1 downto 0);
   PROCESS (control_bit)
   BEGIN
		if (control_bit='1') then
				if ((OPcode ="0001" or OPcode="0010") and (yz="00" or yz="11")) then
					flag_RegAccessed <= '1';
					regAccessed0 <= Current_ins(8 downto 6);
					regAccessed1 <= Current_ins(5 downto 3);
				elsif ((OPcode ="0001" or OPcode="0010") and yz="10" and cz(0)='1') then
					flag_RegAccessed <= '1';
					regAccessed0 <= Current_ins(8 downto 6);
					regAccessed1 <= Current_ins(5 downto 3);
				elsif ((OPcode ="0001" or OPcode="0010") and yz="01" and cz(1)='1') then
					flag_RegAccessed <= '1';
					regAccessed0 <= Current_ins(8 downto 6);
					regAccessed1 <= Current_ins(5 downto 3);
				elsif (OPcode ="0000" or OPcode="1010" or OPcode="0111") then
					flag_RegAccessed <= '1';
					regAccessed0 <= Current_ins(8 downto 6);
					regAccessed1 <= NULL;
				elsif (OPcode ="1000" or OPcode="0101") then
					flag_RegAccessed <= '1';
					regAccessed0 <= Current_ins(8 downto 6);
					regAccessed1 <= Current_ins(11 downto 9);
				elsif (OPcode ="1011" or OPcode="1101" or OPcode="1100") then
					flag_RegAccessed <= '1';
					regAccessed0 <= Current_ins(11 downto 9);
					regAccessed1 <= NULL;
				else 
					flag_RegAccessed <= '0';
					regAccessed0 <= NULL;
					regAccessed1 <= NULL;
				end if;
				
				if ((PrevOPcode ="0001" or PrevOPcode="0010") and (Prevyz="00" or Prevyz="11")) then
					flag_RegWritten <= '1';
					regWritten <= Previns(11 downto 9);
				elsif ((PrevOPcode ="0001" or PrevOPcode="0010") and Prevyz="10" and Prevcz(0)='1') then
					flag_RegWritten <= '1';
					regWritten <= Previns(11 downto 9);
				elsif ((PrevOPcode ="0001" or PrevOPcode="0010") and Prevyz="01" and Prevcz(1)='1') then
					flag_RegWritten <= '1';
					regWritten <= Previns(11 downto 9);
				elsif (PrevOPcode ="0000" or PrevOPcode="1100" or PrevOPcode="1001" or PrevOPcode="1010" or PrevOPcode ="1111" or PrevOPcode ="0111") then
					flag_RegWritten <= '1';
					regWritten <= Previns(11 downto 9);
				else 
					flag_RegAccessed <= '0';
					regWritten <= NULL;
				end if;
			end if;
   END PROCESS;
	
	prediction:process (flag_RegWritten, flag_RegAccessed)
	begin
		if (PrevOPcode = "1100" and flag_RegAccessed='1') then
			P <='1';
		elsif (flag_RegWritten = '1' and OPcode = "1101") then
			P<='1';
		elsif (flag_RegWritten = '1' and flag_RegAccessed='1' and ((regAccessed0 = regWritten) or (regAccessed1 = regWritten))) then
			P<='1';
		else 
			P<='0';
		end if;
	end process;
END beh;