library ieee;
use ieee.std_logic_1164.all;
entity DUT is
   port(input_vector: in std_logic_vector(136 downto 0);
       	output_vector: out std_logic_vector(72 downto 0));
end entity;

architecture DutWrap of DUT is
	COMPONENT Mmem IS
		PORT
		(
			clock: IN std_logic;
			rf_ws : IN std_logic_vector(7 downto 0);
			r0,r1,r2,r3,r4,r5, r6,r7:  IN   std_logic_vector(15 downto 0);
			ro0,ro1,ro2,ro3,ro4,ro5, ro6, ro7:  OUT  std_logic_vector(15 downto 0);
			orf_ws : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
begin
   add_instance: Mmem 
			port map (
					rf_ws => input_vector(7 downto 0),
					r0 => input_vector(23 downto 8),
					r1 => input_vector(39 downto 24),
					r2 => input_vector(31 downto 40),
					r3 => input_vector(71 downto 56),
					r4 => input_vector(87 downto 72),
					r5 => input_vector(103 downto 88),
					r6 => input_vector(119 downto 104),
					r7 => input_vector(135 downto 120),
					clock => input_vector(136),
					
					z_re => input_vector(55),
					z_we => input_vector(56),
					d_re0 => input_vector(57),
					d_we0 => input_vector(58),
					d_re1 => input_vector(59),
					d_we1 => input_vector(60),
					d_re2 => input_vector(61),
					d_we2 => input_vector(62),
					d_re3 => input_vector(63), 
					d_we3 => input_vector(64),
					d_re4 => input_vector(65),
					d_we4 => input_vector(66),
					d_re5 => input_vector(67),
					d_we5 => input_vector(68),
					d_re6 => input_vector(69), 
					d_we6 => input_vector(70),
					d_re7 => input_vector(71),
					d_we7 => input_vector(72), 
					clock => input_vector(73),
					orf_ws => output_vector(7 downto 0),
					orf_rs => output_vector(15 downto 8),
					orf_a => output_vector(23 downto 16),
					orf_b => output_vector(31 downto 24),
					oopcode => output_vector(35 downto 32),
					oyz => output_vector(37 downto 36),
					oimm6 => output_vector(43 downto 38),
					oimm9 => output_vector(52 downto 44),
					oc_we => output_vector(53),
					oc_re => output_vector(54),
					oz_re => output_vector(55),
					oz_we => output_vector(56),
					od_re0 => output_vector(57),
					od_we0 => output_vector(58),
					od_re1 => output_vector(59),
					od_we1 => output_vector(60),
					od_re2 => output_vector(61),
					od_we2 => output_vector(62),
					od_re3 => output_vector(63), 
					od_we3 => output_vector(64),
					od_re4 => output_vector(65),
					od_we4 => output_vector(66),
					od_re5 => output_vector(67),
					od_we5 => output_vector(68),
					od_re6 => output_vector(69), 
					od_we6 => output_vector(70),
					od_re7 => output_vector(71),
					od_we7 => output_vector(72));

end DutWrap;

