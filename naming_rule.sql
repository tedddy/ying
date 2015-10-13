hs_s_rt_EM_get_sma to hs_s_rt_EM_get_smaClose

in proc hs_s_rt_EM_get_smaClose 
	close_tmp to cursor_fetch_tmp
	stock_start_end_limit_cursor to cursor1 
	LOOP_close to cursor1_LOOP1
	
in hs_s_rt_EM_get_smaClose_rt
	close_tmp to cursor_fetch_tmp
	LOOP_close to cursor1_LOOP1
	in_current_close to in_current_value
