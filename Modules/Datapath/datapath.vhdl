library ieee;
use ieee.std_logic_1164.all;
library work;
use work.RRStageMemory.all;
use work.RegisterFile.all;
use work.ProgramCounter.all;
use work.preALUmuxpkg.all;
use work.postALUmux.all;
use work.PCSwitchpckg.all;
use work.IM.all;
use work.Incrementer.all;
use work.IFStageMemory.all;
use work.IDStageMemory.all;
use work.HazardUnit.all;
use work.ForwardingUnitpkg.all;
use work.ExecStageMemory.all;
use work.Decoderpkg.all;
use work.DM.all;
use work.reg_2_bit.all;
use work.branch_predictor.all;
use work.ALUpkg.all;
use work.reg_2_bit.all;
use work.MemStageMemory.all;

entity datapath is 
	port(ins,ins_add : IN std_logic_vector(15 downto 0);
			clk,clk24 ,im_we : IN std_logic;
		   r0, r1 : OUT std_logic_vector(15 downto 0));
end entity datapath;

architecture path of datapath is
signal pc_out, pc, pc_ifreg, im_ifreg, pc_idreg, pc_mem, pc_if, ins_dec,r0_wb,r0_rr,r1_wb,r1_rr,r2_wb,r2_rr,r3_wb,r3_rr,r4_wb,r4_rr,r5_wb,r5_rr,
		 r6_wb,r6_rr,r7_wb,r7_rr,pc_rr,pc_exec,r0_exec,r1_exec,r2_exec,r3_exec,r4_exec,r5_exec,r6_exec,r7_exec,a,b,y,a0,a1,a2,a3,a4,a5,a6,a7,pc_alu,
		 r0_alu,r1_alu,r2_alu,r3_alu,r4_alu,r5_alu,r6_alu,r7_alu, ao0,ao1,ao2,ao3,ao4,ao5,ao6,ao7,d0,d1,d2,d3,d4,d5,d6,d7,r0_MM,r1_MM,r2_MM,r3_MM,r4_MM,r5_MM,r6_MM,r7_MM,
		 r0_FD,r1_FD,r2_FD,r3_FD,r4_FD,r5_FD,r6_FD,r7_FD: std_logic_vector(15 downto 0);
signal P,bp_op,pc_re,c_we, c_re, z_we, z_re, d_re0, d_we0,d_re1, d_we1,d_re2, d_we2,d_re3, 
		 d_we3,d_re4, d_we4,d_re5, d_we5,d_re6, d_we6,d_we7,d_re7,c_weRR, c_reRR, z_weRR, z_reRR, d_re0RR, d_we0RR,d_re1RR, 
		 d_we1RR,d_re2RR, d_we2RR,d_re3RR,d_we3RR,d_re4RR, d_we4RR,d_re5RR, d_we5RR,d_re6RR, d_we6RR,d_we7RR,d_re7RR,c_weEX, c_reEX, z_weEX, z_reEX,
		 d_re0EX, d_we0EX,d_re1EX,d_we1EX,d_re2EX, d_we2EX,d_re3EX,d_we3EX,d_re4EX, d_we4EX,d_re5EX, d_we5EX,d_re6EX, d_we6EX,d_we7EX,d_re7EX,
		 d_re0MM, d_we0MM,d_re1MM,d_we1MM,d_re2MM, d_we2MM,d_re3MM,d_we3MM,d_re4MM, d_we4MM,d_re5MM, d_we5MM,d_re6MM, d_we6MM,d_we7MM,d_re7MM:std_logic;
signal yz_id, yz_rr, yz_exec, cz_dec, cz_alu :std_logic_vector(1 downto 0);
signal imm6_id,imm6_rr, imm6_exec: std_logic_vector(5 downto 0);
signal imm9_id,imm9_rr, imm9_exec: std_logic_vector(8 downto 0);
signal rfrs_id,rfws_id,rfb_id,rfa_id,rfrs_rr,rfws_rr,rfb_rr,rfa_rr,rfrs_exec,rfws_exec,rfb_exec,rfa_exec,rfws_mm,rfws_wb: std_logic_vector(7 downto 0);
signal op_id, op_rr, op_exec: std_logic_vector(3 downto 0);
begin
 incrementer: inc port map(pc => pc_idreg, bp => bp_op, data_out=> pc_out);
 
 progcounter: PCounter port map(clock=>clk, data=>pc_out, write_enable=>'1', read_enable=>pc_re, data_out=>pc_ifreg);
 
 progcountSwitch: PCSwitch port map(bp=>bp_op, pcExec=>pc_mem, pcIF=>pc_ifreg, pc=>pc_if);
 
 insmemory: ROM port map(clock=>clk, data=>ins, write_address=>ins_add, read_address=>pc_ifreg, write_enable=>im_we,	read_enable=>'1', data_out=>im_ifreg);
 
 IFmemory: IFmem port map(clock=>clk, pc_in=>pc_if, ir=>im_ifreg, pc_out=>pc_idreg, iro=>ins_dec);
 
 decode: decoder port map(instruction =>ins_dec,cz=> cz_dec,bp=>bp_op, clock=>clk, yz=>yz_id, imm6=>imm6_id, imm9=>imm9_id, rf_a=>rfa_id, rf_b=> rfb_id, rf_rs=>rfrs_id, rf_ws=>rfws_id, opcode=>op_id,
									pc_re=> pc_re, c_we=>c_we, c_re=>c_re, z_we=>z_we, z_re=>z_re, d_re0=>d_re0, d_we0=>d_we0,d_re1=>d_re1, d_we1=>d_we1, d_re2=>d_re2, d_we2=>d_we2, d_re3=>d_re3,
									d_we3=>d_we3, d_re4=>d_re4, d_we4=>d_we4, d_re5=>d_re5, d_we5=>d_we5, d_re6=>d_re6, d_we6=>d_we6, d_we7=>d_we7, d_re7=>d_re7);
 
 bpComp: BP port map(OPcode=> op_id, clock=>clk, Prediction=>bp_op);
 
 IDmemory: IDmem port map(clock=>clk, yz=>yz_id, imm6=>imm6_id, imm9=>imm9_id, rf_a=>rfa_id, rf_b=> rfb_id, rf_rs=>rfrs_id, rf_ws=>rfws_id, opcode=>op_id,
									c_we=>c_we, c_re=>c_re, z_we=>z_we, z_re=>z_re, d_re0=>d_re0, d_we0=>d_we0,d_re1=>d_re1, d_we1=>d_we1, d_re2=>d_re2, d_we2=>d_we2, d_re3=>d_re3,
									d_we3=>d_we3, d_re4=>d_re4, d_we4=>d_we4, d_re5=>d_re5, d_we5=>d_we5, d_re6=>d_re6, d_we6=>d_we6, d_we7=>d_we7, d_re7=>d_re7,oyz=>yz_rr, oimm6=>imm6_rr, oimm9=>imm9_rr, 
									orf_a=>rfa_rr, orf_b=> rfb_rr, orf_rs=>rfrs_rr, orf_ws=>rfws_rr, oopcode=>op_rr, oc_we=>c_weRR, oc_re=>c_reRR, oz_we=>z_weRR, oz_re=>z_reRR, od_re0=>d_re0RR, od_we0=>d_we0RR,
									od_re1=>d_re1RR, od_we1=>d_we1RR, od_re2=>d_re2RR, od_we2=>d_we2RR, od_re3=>d_re3RR, od_we3=>d_we3RR, od_re4=>d_re4RR, od_we4=>d_we4RR, od_re5=>d_re5RR, od_we5=>d_we5RR, 
									od_re6=>d_re6RR, od_we6=>d_we6RR, od_we7=>d_we7RR, od_re7=>d_re7RR, pc=>pc_idreg, pco=>pc_rr);
 
 Regfile: RF port map(Write_Select=>rfws_wb,Read_Select=>rfrs_rr,clock=>clk24,r0in=>r0_wb,r0out=>r0_rr,r1in=>r1_wb,r1out=>r1_rr,r2in=>r2_wb,r2out=>r2_rr,
							 r3in=>r3_wb,r3out=>r3_rr,r4in=>r4_wb,r4out=>r4_rr,r5in=>r5_wb,r5out=>r5_rr,r6in=>r6_wb,r6out=>r6_rr,r7in=>r7_wb,r7out=>r7_rr);
 
 RRmemory: Rmem port map(clock=>clk,yz=>yz_rr, imm6=>imm6_rr, imm9=>imm9_rr,rf_a=>rfa_rr, rf_b=> rfb_rr, rf_rs=>rfrs_rr, rf_ws=>rfws_rr, op=>op_rr, c_we=>c_weRR, c_re=>c_reRR, z_we=>z_weRR, 
								 z_re=>z_reRR, d_re0=>d_re0RR, d_we0=>d_we0RR,d_re1=>d_re1RR, d_we1=>d_we1RR, d_re2=>d_re2RR, d_we2=>d_we2RR, d_re3=>d_re3RR, d_we3=>d_we3RR, d_re4=>d_re4RR, 
								 d_we4=>d_we4RR, d_re5=>d_re5RR, d_we5=>d_we5RR,d_re6=>d_re6RR, d_we6=>d_we6RR, d_we7=>d_we7RR, d_re7=>d_re7RR,pc_in=>pc_rr,pc_out=>pc_exec,r0=>r0_FD,r1=>r1_FD,
								 r2=>r2_FD,r3=>r3_FD,r4=>r4_FD,r5=>r5_FD,r6=>r6_FD,r7=>r7_FD,orf_rs=>rfrs_exec,orf_ws=>rfws_exec,orf_a=>rfa_exec,orf_b=>rfb_exec,
								 ro0=>r0_exec,ro1=>r1_exec,ro2=>r2_exec,ro3=>r3_exec,ro4=>r4_exec,ro5=>r5_exec,ro6=>r6_exec,ro7=>r7_exec,imm6o=>imm6_exec,yzo=>yz_exec,opo=>op_exec,imm9o=>imm9_exec,
								 oc_we=>c_weEX,oc_re=>c_reEX,oz_re=>z_reEX,oz_we=>z_weEX,od_re0=>d_re0EX, od_we0=>d_we0EX,od_re1=>d_re1EX, od_we1=>d_we1EX,od_re2=>d_re2EX, od_we2=>d_we2EX,
								 od_re3=>d_re3EX,od_we3=>d_we3EX,od_re4=>d_re4EX, od_we4=>d_we4EX,od_re5=>d_re5EX, od_we5=>d_we5EX,od_re6=>d_re6EX, od_we6=>d_we6EX,od_re7=>d_re7EX,od_we7=>d_we7EX);
 
 prealu1: preALUmux port map(rfa=> rfa_exec, a=> a, r0=>r0_exec,r1=>r1_exec,r2=>r2_exec,r3=>r3_exec,r4=>r4_exec,r5=>r5_exec,r6=>r6_exec,r7=>r7_exec);
 prealu2: preALUmux port map(rfa=> rfb_exec, a=> b, r0=>r0_exec,r1=>r1_exec,r2=>r2_exec,r3=>r3_exec,r4=>r4_exec,r5=>r5_exec,r6=>r6_exec,r7=>r7_exec);
 
 hzdUnit: DH port map(Write_Select_Prev=>rfws_mm, Read_Select_Curr=>rfrs_exec, P=>P);
 
 Fwding_r0: FwdUnit port map(dh=>P, aRR=>r0_rr, aExec=>d0, a=>r0_FD);
 Fwding_r1: FwdUnit port map(dh=>P, aRR=>r1_rr, aExec=>d1, a=>r1_FD);
 Fwding_r2: FwdUnit port map(dh=>P, aRR=>r2_rr, aExec=>d2, a=>r2_FD);
 Fwding_r3: FwdUnit port map(dh=>P, aRR=>r3_rr, aExec=>d3, a=>r3_FD);
 Fwding_r4: FwdUnit port map(dh=>P, aRR=>r4_rr, aExec=>d4, a=>r4_FD);
 Fwding_r5: FwdUnit port map(dh=>P, aRR=>r5_rr, aExec=>d5, a=>r5_FD);
 Fwding_r6: FwdUnit port map(dh=>P, aRR=>r6_rr, aExec=>d6, a=>r6_FD);
 Fwding_r7: FwdUnit port map(dh=>P, aRR=>r7_rr, aExec=>d7, a=>r7_FD);
 
 alu_comp: alu port map(op=> op_exec, yz=>yz_exec, imm6=>imm6_exec, imm9=>imm9_exec, pc=> pc_exec, a=>a, b=>b, cz=>cz_alu, y=>y, a0=>a0, a1=>a1, a2=>a2,
								 a3=>a3, a4=>a4, a5=>a5, a6=>a6, a7=>a7, pc_out=>pc_alu);
								
 postalu: postmux port map(rf_ws=> rfws_exec, y=>y, r0=>r0_exec, r1=>r1_exec, r2=>r2_exec, r3=>r3_exec, r4=>r4_exec, r5=>r5_exec, r6=>r6_exec,
										r7=>r7_exec, ro0=>r0_alu, ro1=>r1_alu, ro2=>r2_alu, ro3=>r3_alu, ro4=>r4_alu, ro5=>r5_alu, ro6=>r6_alu, ro7=>r7_alu);
			
 czReg: Carry_zero_register port map(clock=> clk24, data_C=>cz_alu(0), data_Z=>cz_alu(1), write_enable_C=>c_weEX,	write_enable_Z=>z_weEX, read_enable_C=>c_reEX,
			read_enable_Z=>z_reEX, data_out_C=>cz_dec(0), data_out_Z=>cz_dec(1));
		
 EXmemory: Emem port map(rf_ws=> rfws_exec, pc_in=>pc_alu, a0=>a0, a1=>a1, a2=>a2, a3=>a3, a4=>a4, a5=>a5, a6=>a6, a7=>a7,r0=>r0_alu,r1=>r1_alu,r2=>r2_alu,
								 r3=>r3_alu,r4=>r4_alu,r5=>r5_alu,r6=>r6_alu,r7=>r7_alu, orf_ws=>rfws_mm,pc_out=>pc_mem,ao0=>ao0,ao1=>ao1,ao2=>ao2,ao3=>ao3,ao4=>ao4,
								 ao5=>ao5,ao6=>ao6,ao7=>ao7,ro0=>d0,ro1=>d1,ro2=>d2,ro3=>d3,ro4=>d4,ro5=>d5, ro6=>d6,ro7=>d7,clock=>clk,d_re0=>d_re0MM, d_we0=>d_we0MM,
								 d_re1=>d_re1MM, d_we1=>d_we1MM, d_re2=>d_re2MM, d_we2=>d_we2MM, d_re3=>d_re3MM, d_we3=>d_we3MM, d_re4=>d_re4MM, 
								 d_we4=>d_we4MM, d_re5=>d_re5MM, d_we5=>d_we5MM,d_re6=>d_re6MM, d_we6=>d_we6MM, d_we7=>d_we7MM, d_re7=>d_re7MM,
								 od_re0=>d_re0MM, od_we0=>d_we0MM,od_re1=>d_re1MM, od_we1=>d_we1MM,od_re2=>d_re2MM, od_we2=>d_we2MM,
								 od_re3=>d_re3MM,od_we3=>d_we3MM,od_re4=>d_re4MM, od_we4=>d_we4MM,od_re5=>d_re5MM, od_we5=>d_we5MM,od_re6=>d_re6MM, od_we6=>d_we6MM,
								 od_re7=>d_re7MM,od_we7=>d_we7MM);

 Datamemory: RAM port map(clock=> clk24,data0=>d0,data1=>d1,data2=>d2,data3=>d3,data4=>d4,data5=>d5,data6=>d6,data7=>d7,
								  write_address0=>a0, read_address0=>a0, write_enable0=>d_we0MM, read_enable0=>d_re0MM, data_out0=>r0_MM,
								  write_address1=>a1, read_address1=>a1, write_enable1=>d_we1MM, read_enable1=>d_re1MM, data_out1=>r1_MM,
								  write_address2=>a2, read_address2=>a2, write_enable2=>d_we2MM, read_enable2=>d_re2MM, data_out2=>r2_MM,
								  write_address3=>a3, read_address3=>a3, write_enable3=>d_we3MM, read_enable3=>d_re3MM, data_out3=>r3_MM,
								  write_address4=>a4, read_address4=>a4, write_enable4=>d_we4MM, read_enable4=>d_re4MM, data_out4=>r4_MM,
								  write_address5=>a5, read_address5=>a5, write_enable5=>d_we5MM, read_enable5=>d_re5MM, data_out5=>r5_MM,
								  write_address6=>a6, read_address6=>a6, write_enable6=>d_we6MM, read_enable6=>d_re6MM, data_out6=>r6_MM,
								  write_address7=>a7, read_address7=>a7, write_enable7=>d_we7MM, read_enable7=>d_re7MM, data_out7=>r7_MM);
 
 MMmemory: Mmem port map(rf_ws=>rfws_mm, clock=>clk, orf_ws=>rfws_wb, r0=>r0_MM, r1=>r1_MM, r2=>r2_MM,r3=>r3_MM,r4=>r4_MM,r5=>r5_MM,r6=>r6_MM,r7=>r7_MM,
								 ro0=>r0_WB,ro1=>r1_WB,ro2=>r2_WB,ro3=>r3_WB,ro4=>r4_WB,ro5=>r5_WB,ro6=>r6_WB,ro7=>r7_WB);
end path;