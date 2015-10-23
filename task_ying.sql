task list

13:34 2015-10-23	s_xts clo sma	

	going to replace `tableTMPL` with `s_xts`, `idTMPL` with `ids`, `dtTMPL` with `d`, `fieldTMPL` with `clo`
	save file proc_tableTMPL_idTMPL_dtTMPL_fieldTMPL_sma.sql as proc_s_xts_ids_d_clo_sma.sql
	replace
		tableTMPL	to	s_xts	29 replaced
		idTMPL		to	ids		37 replaced
		dtTMPL		to	d		42 replaced
		fieldTMPL	to	clo		32 replaced
	execute file proc_s_xts_ids_d_clo_sma.sql & test all procedures
	
