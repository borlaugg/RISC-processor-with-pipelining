library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(34 downto 0);
       	output_vector: out std_logic_vector(31 downto 0));
end entity;

architecture DutWrap of DUT is
	COMPONENT datapath IS
		port(ins,ins_add : IN std_logic_vector(15 downto 0);
				clk,clk24 ,im_we : IN std_logic;
				r0, r1 : OUT std_logic_vector(15 downto 0));
	END COMPONENT;
begin
   add_instance: datapath 
			port map (
					ins => input_vector(15 downto 0),
					ins_add => input_vector(31 downto 16),
					clk => input_vector(32),
					clk24 => input_vector(33),
					im_we => input_vector(34),
					
					r0 => output_vector(15 downto 0),
					r1 => output_vector(31 downto 16)
					);

end DutWrap;

