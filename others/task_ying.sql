task list

start: 13:34 2015-10-23	s_xts clo sma	end: 16:17 2015-10-23

	going to replace `tableTMPL` with `s_xts`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `clo`
	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_sma.sql as proc_s_xts_ids_d_clo_sma.sql
	replace
		tableTMPL	with	s_xts	29 replaced
		idTMPL		with	ids		37 replaced
		dtTMPL		with	d		42 replaced
		fieldTMPL	with	clo		32 replaced
	execute file proc_s_xts_ids_d_clo_sma.sql & test all procedures
	
start: 12:43 2015-10-24	s_xts_sma clo5 d1	end: 17:52 2015-10-23	update d1 of field clo5 for table s_xts_sma

	going to replace `tableTMPL` with `s_xts_sma`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `clo5`
	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_sma_ids_d_clo5_d1.sql
	replace
		tableTMPL	with	s_xts_sma	7 replaced
		idTMPL		with	ids		7 replaced
		dtTMPL		with	d		7 replaced
		fieldTMPL	with	clo5		13 replaced
	execute file proc_s_xts_ids_d_clo_sma.sql & test all procedures
	
start: 12:43 2015-10-24	create view for latest fa in s_xts_adj_hst_sina	end: 11:51 2015-10-26		E:\user_tony\Documents\GitHub\ying\locoy\locoy_w_MM.sql


start: 12:03 2015-10-26	task: sma for s_xts_adj		end: 2015-10-26


start: 10:00 2015-10-26		task: migrate project hk_w_MarketMaker		end: 


start: 9:23 2015-10-27		task: migrate project hs_index_xts_EM		end: 


start: 9:51 2015-10-30		task: `ying_calc`.`index_cons_stat_zd` 	end: 
	
	
start: 10:25 2015-10-30		task: locoy_s_rt, revise proc to insert records into two tables 		end: 

start: 13:29 2015-11-02	`s_xts_adj_sma` `close5` d1	end: 	update d1 of field close5 for table `s_xts_adj_sma`

	going to replace `tableTMPL` with `s_xts_adj_sma`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `close5`
	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_s_xts_adj_sma_ids_d_close5_d1.sql
	replace
		tableTMPL	with	`ying_calc`.`s_xts_adj_sma`	7 replaced
		idTMPL		with	ids		7 replaced
		dtTMPL		with	d		7 replaced
		fieldTMPL	with	close5		13 replaced
	execute file proc_s_xts_adj_sma_ids_d_close5.sql & test all procedures
	
	`s_xts_adj_sma` `close10` d1
	`s_xts_adj_sma` `close20` d1
	`s_xts_adj_sma` `close30` d1
	
	`s_xts_adj_sma` `amount5` d1
	`s_xts_adj_sma` `amount10` d1
	`s_xts_adj_sma` `amount20` d1
	`s_xts_adj_sma` `amount30` d1

start: 11:06 2015-11-03		end: 11:30 2015-11-03
tasks: 		
	`s_xts_adj_sma` `close60` d1
	`s_xts_adj_sma` `close120` d1
	
	`s_xts_adj_sma` `amount60` d1
	`s_xts_adj_sma` `amount120` d1


start: 10:00 2015-10-26		task: 		end: 
tasks: 		
	`s_xts_adj_sma` `close5_d1` sma (compute sma of field `close5_d1` in table `s_xts_adj_sma`)
	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_d1.sql as proc_`s_xts_adj_sma`_ids_d_`close5_d1`_sma.sql
	replace
		tableTMPL	with	s_xts_adj_sma	7 replaced
		idTMPL		with	ids		7 replaced
		dtTMPL		with	d		7 replaced
		fieldTMPL	with	close5_d1		13 replaced
start: 10:00 2015-10-26		task: 		end: 


start: 10:00 2015-10-26		task: 		end: 


start: 10:00 2015-10-26		task: 		end: 


start: 10:00 2015-10-26		task: 		end: 


start: 10:00 2015-10-26		task: 		end: 



	